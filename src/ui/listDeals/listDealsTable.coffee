root.dealsTable = Titanium.UI.createTableView
	data: []
	backgroundColor: '#0d1e28'
	separatorColor: '#1b3c50'

mapButton = Titanium.UI.createButton
	title: 'Mapa'

mapButton.addEventListener 'click', (e) ->
	root.listDealsMapView.annotations = root.annotations
	root.tabGroup.activeTab.open(root.listDealsMapWindow,{animated:true})

root.listDealsWindow.rightNavButton = mapButton

root.listDealsWindow.add(root.dealsTable)

root.reloadDeals = false

root.why3Row = new root.GenericTextRow().row
root.why3Row.hasChild = true
root.why3Row.rightImage = '/images/blue_arrow.png'
textLabel = Titanium.UI.createLabel
	text: L('why3Title')
	color: '#fff'
	font:
		fontSize: 14
		fontWeight: 'bold'
	left: 10
	height: 30
root.why3Row.add(textLabel)

root.dealsTable.addEventListener 'click', (e) ->
	if e.row.deal is undefined
		root.tabGroup.activeTab.open(root.why3Window,{animated:true})
	else
		root.showDealView(e.row.deal)
		root.tabGroup.activeTab.open(root.oneDealWindow,{animated:true})

root.showDeals = (deals) ->	
	Ti.API.info "Entra en showDeals: " + deals.length	
	root.citiesWindow.remove(root.errorView)	
	if deals.length is 0 
		Ti.API.info '****** No hay hoteles activos en esta ciudad ********'
		root.tabGroup.activeTab.open(root.noDealsWindow,{animated:true})
		root.hideLoading(root.listDealsWindow)
		root.hideLoading(root.citiesWindow)
	else 
		root.createMap(deals)
		if root.cityHasZones(deals)
			root.populateDealsZoneTable(deals)
		else 
			root.populateDealsTable(deals)
	Ti.API.info '*** Sale de showDeals'


root.cityHasZones = (deals) ->
	lastName = "null"
	zonas = 0
	for deal in deals
		if deal.city.name isnt lastName
			zonas++
		lastName = deal.city.name
	if zonas > 1 
		return true
	else return false
		

root.populateDealsTable = (deals) ->
	Ti.API.info '*** Entra en populateDealsTable'
	data = []
	for deal in deals	
		dealRow = new root.listDealsRow(deal)
		data.push(dealRow.row)
	data.push(root.why3Row)
	root.dealsTable.setData(data)
	Ti.API.info '*** LLama a EndPopulate'
	root.endPopulate()

root.populateDealsZoneTable = (deals) ->
	Ti.API.info '*** Entra en populate Zonas '
	data = []	
	lastName = "empty"
	first = true
	section = Titanium.UI.createTableViewSection()
	for deal in deals
		city = deal.city
		dealRow = new root.listDealsRow(deal)
		if city.name isnt lastName 
			Ti.API.info 'Entra en CABECERA'
			if first isnt true 
				data.push(section)
			header = new root.DealHeaderView(city.name)
			first = false
			section = Titanium.UI.createTableViewSection
				headerView: header.view		
		section.add(dealRow.row)
		lastName = city.name
	data.push(section)		
	data.push(root.why3Row)
	root.dealsTable.setData(data)		
	root.endPopulate()
	Ti.API.info '*** fin populateDealsZoneTable'

root.endPopulate = () ->
	Ti.API.info 'Entra en endPopulate'
	root.hideLoading(root.listDealsWindow)
	root.hideLoading(root.citiesWindow)
	if root.reloadDeals is false
		Ti.API.info '*** Entra en abrir ventana'
		root.tabGroup.activeTab.open(root.listDealsWindow,{animated:true})
	root.reloadDeals = false
	Ti.API.info 'Fin endPopulate'	

root.loadDeals = (city) ->
	Ti.API.info 'Entra en loadDeals'
	root.showLoading(root.listDealsWindow,L('updatingHotels'))
	root.city = city
	root.listDealsWindow.title = city.name
	root.noDealsWindow.title = city.name
	root.fetchDeals(city)
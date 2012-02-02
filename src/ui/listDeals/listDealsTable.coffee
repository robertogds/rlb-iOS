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
	root.createMap(deals)
	if deals.length is 0 
		root.endPopulate(true)
	else if root.city.type is 'zone'
		root.populateDealsZoneTable(deals)
	else 
		root.populateDealsTable(deals)

root.populateDealsTable = (deals) ->
	data = []
	for deal in deals
		dealRow = new root.listDealsRow(deal)
		data.push(dealRow.row)
	data.push(root.why3Row)
	root.noDealsView.hide()
	root.listDealsWindow.remove(root.noDealsView)
	root.dealsTable.setData(data)
	root.endPopulate(false)


root.populateDealsZoneTable = (deals) -> 
	data = []
	header = new root.dealHeaderView(root.city.name)
	section = Ti.UI.createTableViewSection
		headerView: header.view
	name = "empty"
	for deal in deals
		city = deal.city
		dealRow = new root.listDealsRow(deal)
		if name is "empty"
			header.text = city.name
			name = city.name
		if city.name isnt name
			data.push(section)
			header = new root.dealHeaderView(city.name)
			section = Ti.UI.createTableViewSection
				headerView: header.view
			name = city.name
			section.add(dealRow.row)
		else section.add(dealRow.row)
	data.push(section)	
	data.push(root.why3Row)
	root.noDealsView.hide()
	root.listDealsWindow.remove(root.noDealsView)
	root.dealsTable.setData(data)			
	root.endPopulate(false)
	
	
root.endPopulate = (empty) ->
	Ti.API.info "Entra en endPopulate"
	if empty is true
		Ti.API.info '****** No hay hoteles activos en esta ciudad ********'
		root.listDealsWindow.add(root.noDealsView)
		root.noDealsView.show()
	root.hideLoading(root.listDealsWindow)
	root.hideLoading(root.citiesWindow)
	if root.reloadDeals is false
		root.tabGroup.activeTab.open(root.listDealsWindow,{animated:true})
	root.reloadDeals = false
		

root.loadDeals = (city) ->
	Ti.API.info 'Entra en loadDeals'
	root.showLoading(root.listDealsWindow,L('updatingHotels'))
	root.city = city
	root.listDealsWindow.title = city.name
	root.fetchDeals(city)



  




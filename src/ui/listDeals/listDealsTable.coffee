root.dealsTable = Titanium.UI.createTableView
  data: [Ti.UI.createTableViewRow({title:'Loading...'})]
  backgroundColor: '#0d1e28'
  separatorColor: '#1b3c50'

if Titanium.Platform.name is 'android'
	root.dealsTable.setData([Ti.UI.createTableViewRow({title:'Loading...'})])

# [android] Remove all mapButton
#mapButton = Titanium.UI.createButton
#  title: 'Mapa'
#
#mapButton.addEventListener 'click', (e) ->
#  root.listDealsMapView.annotations = root.annotations
#  root.tabGroup.activeTab.open(root.listDealsMapWindow,{animated:true})
#
#root.listDealsWindow.rightNavButton = mapButton

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
	root.tabGroup.activeTab.open(root.listDealsWindow,{animated:true})
	Ti.API.info "Entra en showDeals: " + deals.length
	root.citiesWindow.remove(root.errorView)	
	if deals.length is 0 
		Ti.API.info '****** No hay hoteles activos en esta ciudad ********'
		root.listDealsWindow.add(root.noDealsView)
		root.noDealsView.show()
		root.endPopulate()
		Ti.API.info 'Termina'
	else 
		Ti.API.info '*** Entra en hay hoteles'
		#[android]root.createMap(deals)
		if root.city.hasZones is true
			root.populateDealsZoneTable(deals)
		else 
			root.populateDealsTable(deals)

root.populateDealsTable = (deals) ->
	root.dealsData = []
	for deal in deals
		dealRow = new root.listDealsRow(deal)
		root.dealsData.push(dealRow.row)
	root.dealsData.push(root.why3Row)
	root.noDealsView.hide()
	root.listDealsWindow.remove(root.noDealsView)
	root.endPopulate()


root.populateDealsZoneTable = (deals) ->
	Ti.API.info '*** Entra en populate Zonas ' + root.dealsTable
	root.zoneUrl = 'null'
	root.dealsData = []	
	name = "empty"
	first = true
	#for deal in deals
	#	city = deal.city
	#	if city.url is root.zoneUrl 
	#		if first is true
	#			header = new root.dealHeaderView('')
	#			section = Ti.UI.createTableViewSection
	#				headerView: header.view
	#				headerTitle: L(city.url)
	#			first = false
	#		header.textLabel.text = L(city.url)
	#		dealRow = new root.listDealsRow(deal)
	#		section.add(dealRow.row)
	#		name = city.name
	#		firstName = city.name
	for deal in deals
		city = deal.city
		dealRow = new root.listDealsRow(deal)
		if city.name isnt name and city.url isnt root.zoneUrl
			root.dealsData.push(section)
			header = new root.dealHeaderView(L(city.url))
			section = Ti.UI.createTableViewSection
				headerView: header.view
				headerTitle: L(city.url)
			name = city.name
			section.add(dealRow.row)
		else if city.url isnt root.zoneUrl 
			section.add(dealRow.row)
	root.dealsData.push(section)	
	root.dealsData.push(root.why3Row)
	root.noDealsView.hide()
	root.listDealsWindow.remove(root.noDealsView)			
	root.endPopulate(false)
	
	
root.endPopulate = () ->
	#[android] el reloadDeals no sirve
#	if root.reloadDeals is false	
#	root.reloadDeals = false
	# [android] sino meter el setdata antes
	root.dealsTable.setData(root.dealsData)
	root.hideLoading(root.listDealsWindow)
	root.hideLoading(root.citiesWindow)
		

root.loadDeals = (city) ->
	Ti.API.info 'Entra en loadDeals'
	root.showLoading(root.listDealsWindow,L('updatingHotels'))
	root.city = city
	root.listDealsWindow.title = city.name
	root.fetchDeals(city)



  




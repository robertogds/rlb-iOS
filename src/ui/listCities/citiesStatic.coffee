root.citiesTable = Titanium.UI.createTableView
	data: []
	#backgroundColor: 'white'
	#backgroundColor: '#08151d'
	backgroundImage: '/images/texture2.jpg'
	#separatorColor: '#0d1e28'
	separatorColor: 'transparent'

root.citiesWindow.add(root.citiesTable)

root.citiesTable.addEventListener 'click', (e) ->
	if e.row.city isnt undefined
		Ti.API.info 'Entra en click a ciudad'
		root.showLoading(root.citiesWindow,L('updatingHotels'))
		root.loadDeals(e.row.city)

root.populateCitiesTable = (cities) ->
	root.citiesWindow.remove(root.errorView)
	data = []
	n = 0
	list = {}
	for city in cities
		n++
		list[n] = city
		if n is 3
			cityColumn = new root.cityColumn(list[1],list[2],list[3])
			data.push(cityColumn.row)
			n = 0
			list[1] = undefined
			list[2] = undefined
			list[3] = undefined
		
	cityColumn = new root.cityColumn(list[1],list[2],list[3])
	data.push(cityColumn.row)
	root.citiesTable.setData(data)
	root.hideLoading(root.countriesWindow)
	root.hideLoading(root.citiesWindow)
	root.tabGroup.activeTab.open(root.citiesWindow,{animated:true})

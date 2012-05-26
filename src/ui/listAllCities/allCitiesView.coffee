Ti.include(
	'/js/CityHeaderView.js'
	'/js/OtherCityRow.js'
)

root.allCitiesTable = Titanium.UI.createTableView
	data: []
	backgroundColor: 'transparent'
	separatorColor: '#1b3c50'

root.allCitiesWindow.add(root.allCitiesTable)

root.allCitiesTable.addEventListener 'click', (e) ->
	root.showLoading(root.allCitiesWindow,L('updatingHotels'))
	root.loadDeals(e.row.city)	

root.populateCitiesTable = (cities) ->
	Ti.API.info 'Entra en all cities'
	data = []	
	lastName = "empty"
	first = true
	section = Titanium.UI.createTableViewSection()
	for city in cities
		Ti.API.info 'Entra en city ' + city.name + ' Country ' + city.country
		if city.isRoot
			cityRow = new root.OtherCityRow(city)
			if city.country isnt lastName 
				if first isnt true
					data.push(section)
				header = new root.CityHeaderView(city.country)
				first = false
				section = Titanium.UI.createTableViewSection(headerView: header.view)		
			section.add(cityRow.row)
			lastName = city.country
	data.push(section)		
	if data.length is 0
		root.allCitiesWindow.close()
	else
		root.allCitiesTable.setData(data)		
		root.allCitiesTable.footerView = root.footerView
	root.hideLoading(root.allCitiesWindow)
	Ti.API.info '*** fin populateDealsZoneTable'

	
root.showAllCities = () ->
	root.fetchCities('ALLCITIES')
	root.tabGroup.tabs[root.dealsTab.pos].open(root.allCitiesWindow,{animated:true})
	
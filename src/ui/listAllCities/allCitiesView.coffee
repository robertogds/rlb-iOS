Ti.include('/js/OtherCityRow.js')

root.footerView = Titanium.UI.createView
	backgroundColor:'transparent' 
	borderWidth: 0
	height:100
	width:'100%'

root.allCitiesTable = Titanium.UI.createTableView
	data: []
	backgroundColor: 'transparent'
	separatorColor: '#1b3c50'

root.allCitiesWindow.add(root.allCitiesTable)

root.allCitiesTable.addEventListener 'click', (e) ->
	#alert 'Entrariamos a ' + e.row.city.name
	root.loadDeals(e.row.city)
	root.tabGroup.activeTab.open(root.oneBookingWindow,{animated:true})


#	@cityImage.addEventListener 'click', (e) ->
#		Ti.API.info '*** Entra en click'
#		city = e.source.city
#		cell = root.cell[city.name]	
#		root.showLoading(root.citiesWindow,L('updatingHotels'))
#		Ti.API.info '*** LLama a loadDeals'
#		root.loadDeals(e.source.city)


root.populateCitiesTable = (cities) ->
	Ti.API.info 'Entra en all cities'
	data = []
	for city in cities
		Ti.API.info city.name + ' ' + city.isRoot
		if city.isRoot is true
			cityRow = new root.OtherCityRow(city)
			data.push(cityRow.row)
	if data.length is 0
		root.allCitiesWindow.close()
	else
		root.allCitiesTable.setData(data)
	root.allCitiesTable.footerView = root.footerView
	root.hideLoading(root.allCitiesWindow)

	
root.showAllCities = () ->
	root.fetchCities()
	root.tabGroup.activeTab.open(root.allCitiesWindow,{animated:true})
	root.showLoading(root.allCitiesWindow)
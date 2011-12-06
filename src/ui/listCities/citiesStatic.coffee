root.citiesTable = Titanium.UI.createTableView
	data: []
	backgroundColor: 'transparent'
	separatorColor: 'transparent'

root.citiesWindow.add(root.citiesTable)

gpsButton = Titanium.UI.createButton
	title: 'GPS'

gpsButton.addEventListener 'click', (e) ->
	root.initializeGPS()

root.citiesWindow.rightNavButton = gpsButton

root.citiesTable.addEventListener 'click', (e) ->
	if e.row.city isnt undefined
		Ti.API.info 'Entra en click a ciudad'
		root.showLoading(root.citiesWindow,L('updatingHotels'))
		root.loadDeals(e.row.city)

citiesData = []
n = 0
list = {}
for city in root.staticCities
	n++
	list[n] = city
	if n is 3
		cityColumn = new root.cityColumn(list[1],list[2],list[3])
		citiesData.push(cityColumn.row)
		n = 0
		list[1] = undefined
		list[2] = undefined
		list[3] = undefined
		
cityColumn = new root.cityColumn(list[1],list[2],list[3])
citiesData.push(cityColumn.row)
root.citiesTable.setData(citiesData)


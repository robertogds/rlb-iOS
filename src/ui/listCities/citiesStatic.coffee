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

root.citiesData = []
n = 0
list = {}
for city in root.staticCities
	n++
	list[n] = city
	if n is 3
		cityRow = new root.cityRow(list[1],list[2],list[3])
		root.citiesData.push(cityRow.row)
		n = 0
		list[1] = undefined
		list[2] = undefined
		list[3] = undefined
		
cityRow = new root.cityRow(list[1],list[2],list[3])
root.citiesData.push(cityRow.row)
root.citiesTable.setData(root.citiesData)


root.citiesTable = Titanium.UI.createTableView
	data: []
	backgroundColor: 'transparent'
	separatorColor: 'transparent'
	
if Titanium.Platform.name is 'android'
	root.citiesTable.setData([Ti.UI.createTableViewRow({title:'Loading...'})])

root.citiesWindow.add(root.citiesTable)

gpsButton = Titanium.UI.createButton
	title: 'GPS'

gpsButton.addEventListener 'click', (e) ->
	root.initializeGPS()

root.citiesWindow.rightNavButton = gpsButton

root.citiesData = []
n = 0
list = {}
mainCitiesHeader = new root.dealHeaderView(L('main_cities'))
mainCitiesSection = Ti.UI.createTableViewSection
	headerView: mainCitiesHeader.view


otherCitiesHeader = new root.dealHeaderView(L('more_cities'))
otherCitiesSection = Ti.UI.createTableViewSection
	headerView: otherCitiesHeader.view

for city in root.staticCities	
	n++
	list[n] = city
	if n is 3
		cityRow = new root.cityRow(list[1],list[2],list[3])
		#mainCitiesSection.add(cityRow.row)
		root.citiesData.push(cityRow.row)
		n = 0
		list[1] = undefined
		list[2] = undefined
		list[3] = undefined	
n = 0	
#root.citiesData.push(mainCitiesSection)
root.citiesTable.setData(root.citiesData)
for city in root.staticOtherCities
	n++
	list[n] = city
	if n is 3
		cityRow = new root.cityRow(list[1],list[2],list[3])
		otherCitiesSection.add(cityRow.row)
		#root.citiesData.push(cityRow.row)
		n = 0
		list[1] = undefined
		list[2] = undefined
		list[3] = undefined	

root.cell['more'].inactiveView.visible = true
#cityRow = new root.cityRow(list[1],list[2],list[3])
#otherCitiesSection.add(cityRow.row)
root.citiesData.push(otherCitiesSection)
root.citiesTable.setData(root.citiesData)


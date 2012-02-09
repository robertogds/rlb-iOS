Ti.include(
  #'/js/citiesRow.js'
  '/js/zoneCell.js'
  '/js/cityCell.js'
  '/js/cityRow.js'
  #'/js/citiesTable.js'
  '/js/citiesStatic.js'
)

root.deactivateCells = (cityName) ->
	for otherCity in root.staticCities
		if otherCity.name isnt cityName
			root.cell[otherCity.name].inactiveView.visible = true

root.activateCells = () ->
	for otherCity in root.staticCities
		cell = root.cell[otherCity.name]
		cell.inactiveView.visible = false
		if cell.cityImage.open is true
			rowToDelete = cell.cityImage.city.row + 1
			cell.cityImage.open = false
	root.citiesTable.deleteRow(rowToDelete)
		

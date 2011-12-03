Ti.include(
  '/js/cityRow.js'
  '/js/cityColumn.js'
  #'/js/citiesTable.js'
  '/js/citiesStatic.js'
)
root.citiesWindow.addEventListener 'focus', (e) ->
	#root.mockFetchCities()
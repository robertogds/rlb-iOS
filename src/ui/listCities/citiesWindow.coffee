Ti.include(
  '/js/citiesRow.js'
  '/js/citiesTable.js'
)
root.citiesWindow.addEventListener 'focus', (e) ->
  root.currentWindow = 'cities'
  root.showCities()
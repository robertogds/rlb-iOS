Ti.include(
  '/js/countriesRow.js'
  '/js/countriesTable.js'
)
root.countriesWindow.addEventListener 'focus', (e) ->
	alert 'Entra en fetch countries'
	root.fetchCountries()
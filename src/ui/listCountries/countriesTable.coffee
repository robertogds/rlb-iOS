footerView = Titanium.UI.createView
    backgroundColor:'#0d1e28' 
    borderWidth: 0
    height:100

root.countriesTable = Titanium.UI.createTableView
  data: []
  backgroundColor: '#0d1e28'
  separatorColor: '#1b3c50'
  footerView: footerView

root.countriesWindow.add(root.countriesTable)

root.countriesTable.addEventListener 'click', (e) ->
  if e.row.country isnt undefined
    root.showLoading(root.countriesWindow)
    root.fetchCities(e.row.country.url)
    root.country = e.row.country.url
 

root.populateCountriesTable = (countries) ->
  root.countriesWindow.remove(root.errorView)
  data = []
  for country in countries
    countryRow = new root.countriesRow(country)
    data.push(countryRow.row)
  root.countriesTable.setData(data)
  root.hideLoading(root.countriesWindow)


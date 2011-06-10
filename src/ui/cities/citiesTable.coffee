Ti.include('js/citiesRow.js')
root.citiesTable = Titanium.UI.createTableView
  data: []
  #backgroundColor: '#093b4e'
  #separatorColor: '#0c4a60'
  #separatorColor: '#093b4e'
  backgroundColor: '#0b222e'
  separatorColor: '#0b222e'
root.citiesWindow.add(root.citiesTable)

root.citiesTable.addEventListener 'click', (e) ->
  root.listDealsWindow.add(root.loadingView)
  root.loadDeals(e.row.city)
  root.showDeals()
  

# This will handle the JSON
root.xhrCities = Titanium.Network.createHTTPClient()

root.xhrCities.onload = () ->
  cities = JSON.parse(this.responseText)
  data = []
  for city in cities
    cityRow = new root.citiesRow(city)
    data.push(cityRow.row)
  root.citiesTable.setData(data)
  root.citiesWindow.remove(root.loadingView)

root.xhrCities.onerror = () ->
  alert 'Se produjo un error. Intentelo más tarde'

root.xhrCities.timedOut = () ->
  alert 'Se produjo un timeout. Intentelo más tarde'

root.showCities = () ->
  root.citiesWindow.add(root.loadingView)
  root.xhrCities.open('GET', 'http://rlb-back.appspot.com/cities')
  root.xhrCities.send()
  
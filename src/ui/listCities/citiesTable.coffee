Ti.include('/js/citiesRow.js')
root.citiesTable = Titanium.UI.createTableView
  data: []
  backgroundColor: '#0b222e'
  separatorColor: '#0b222e'
root.citiesWindow.add(root.citiesTable)

root.citiesTable.addEventListener 'click', (e) ->
  root.listDealsWindow.add(root.loadingView)
  root.loadDeals(e.row.city)
  root.showDeals()
  
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
  alert 'Se produjo un error'
  root.citiesWindow.remove(root.loadingView)
  root.showError()

root.xhrCities.timedOut = () ->
  alert 'Se produjo un timeout. Intentelo más tarde'

root.showCities = () ->
  if Titanium.Network.online is false
    alert 'Para usar esta aplicacion debes tener conexion a internet'
    root.showError()
  else
    #root.tabGroup.activeTab.open(root.listCitiesWindow,{animated:true})
    root.citiesWindow.add(root.loadingView)
    root.xhrCities.open('GET', root.url+'/cities')
    root.xhrCities.send()
  
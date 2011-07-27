footerView = Titanium.UI.createView
    backgroundColor:'#0d1e28' 
    borderWidth: 0
    height:100
    width:320

root.citiesTable = Titanium.UI.createTableView
  data: []
  backgroundColor: '#0d1e28'
  separatorColor: '#1b3c50'
  footerView: footerView

root.citiesWindow.add(root.citiesTable)

root.citiesTable.addEventListener 'click', (e) ->
  root.citiesWindow.add(root.loadingView)
  root.loadDeals(e.row.city)

  
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
  alert L('errorHappened')
  root.citiesWindow.remove(root.loadingView)
  root.showError()

root.showCities = () ->
  if Titanium.Network.online is false
    alert L('mustInternet')
    root.showError()
  else
    root.citiesWindow.add(root.loadingView)
    root.xhrCities.open('GET', root.url+'/cities')
    root.xhrCities.setRequestHeader("Accept-Language",Titanium.Locale.currentLanguage)
    root.xhrCities.send()
  
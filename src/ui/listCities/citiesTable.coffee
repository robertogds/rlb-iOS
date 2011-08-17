footerView = Titanium.UI.createView
    backgroundColor:'#0d1e28' 
    borderWidth: 0
    height:100
    #width:320

root.citiesTable = Titanium.UI.createTableView
  data: []
  backgroundColor: '#0d1e28'
  separatorColor: '#1b3c50'
  footerView: footerView

root.citiesWindow.add(root.citiesTable)

root.citiesTable.addEventListener 'click', (e) ->
  #actInd = Titanium.UI.createActivityIndicator
  #  height:50
  #  width:10
  root.showLoading(root.citiesWindow)
  root.loadDeals(e.row.city)
  

  
root.xhrCities = Titanium.Network.createHTTPClient()

root.xhrCities.onload = () ->
  root.citiesWindow.remove(root.errorView)
  cities = JSON.parse(this.responseText)
  data = []
  for city in cities
    cityRow = new root.citiesRow(city)
    data.push(cityRow.row)
  root.citiesTable.setData(data)
  root.hideLoading(root.citiesWindow)

root.xhrCities.onerror = () ->
  Ti.API.info("Entra en error de ciudades onerror")
  #alert L('errorHappened')
  root.hideLoading(root.citiesWindow)
  root.showError(root.citiesWindow)

root.showCities = () ->
  if Titanium.Network.online is false
    Ti.API.info("Entra en no hay internet")
    alert L('mustInternet')
    #root.citiesWindow.add(root.errorView)
    root.showError(root.citiesWindow)
  else
    root.xhrCities.setTimeout(8000)
    root.showLoading(root.citiesWindow)
    root.xhrCities.open('GET', root.url+'/cities')
    root.xhrCities.setRequestHeader("Accept-Language",Titanium.Locale.currentLanguage)
    root.xhrCities.send()
  
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
  root.showLoading(root.citiesWindow)
  root.loadDeals(e.row.city)
  
root.xhrCities = Titanium.Network.createHTTPClient()

root.xhrCities.onload = () ->
  root.citiesWindow.remove(root.errorView)
  cities = JSON.parse(this.responseText)
  data = []
  textRow = new root.GenericTextRow().row
  textRow.backgroundGradient = 
    type:'linear'
    colors:[{color:'#07151d',position:0.1},{color:'#07151d',position:1.0}]
  textLabel = Titanium.UI.createLabel
    text: L('citiesToday')
    color: '#fff'
    font:
      fontSize: 12
    left: 10
  textRow.add(textLabel)
  data.push(textRow)
  for city in cities
    cityRow = new root.citiesRow(city)
    data.push(cityRow.row)
  root.citiesTable.setData(data)
  root.hideLoading(root.citiesWindow)

root.xhrCities.onerror = () ->
  Ti.API.info("Entra en error de ciudades onerror")
  root.hideLoading(root.citiesWindow)
  root.showError(root.citiesWindow)

root.showCities = () ->
  if Titanium.Network.online is false
    Ti.API.info("Entra en no hay internet")
    Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:L('mustInternet')}).show()
    #root.citiesWindow.add(root.errorView)
    root.showError(root.citiesWindow)
  else
    root.xhrCities.setTimeout(8000)
    root.showLoading(root.citiesWindow)
    root.xhrCities.open('GET', root.url+'/cities')
    root.xhrCities.setRequestHeader("Accept-Language",Titanium.Locale.currentLanguage)
    root.xhrCities.send()
  
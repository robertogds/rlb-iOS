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
    root.showCities(e.row.country.url)
    root.country = e.row.country.url
 
root.xhrCountries = Titanium.Network.createHTTPClient()

root.xhrCountries.onload = () ->
  root.countriesWindow.remove(root.errorView)
  Ti.API.info(this.responseText)
  countries = JSON.parse(this.responseText)
  data = []
  for country in countries
    countryRow = new root.countriesRow(country)
    data.push(countryRow.row)
  root.countriesTable.setData(data)
  root.hideLoading(root.countriesWindow)

root.xhrCountries.onerror = () ->
  root.hideLoading(root.countriesWindow)
  root.showError(root.countriesWindow)

root.showCountries = () ->
  if Titanium.Network.online is false
    Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:L('mustInternet')}).show()
    root.showError(root.countriesWindow)
  else
    root.xhrCountries.setTimeout(15000)
    root.showLoading(root.countriesWindow)
    root.xhrCountries.open('GET', root.url+'/countries')
    root.xhrCountries.setRequestHeader("Accept-Language",Titanium.Locale.currentLanguage)
    root.xhrCountries.send()

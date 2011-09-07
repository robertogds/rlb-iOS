root.dealsTable = Titanium.UI.createTableView
  data: []
  backgroundColor: '#0d1e28'
  separatorColor: '#1b3c50'

mapButton = Titanium.UI.createButton
  title: 'Mapa'

mapButton.addEventListener 'click', (e) ->
  root.listDealsMapView.annotations = root.annotations
  root.tabGroup.activeTab.open(root.listDealsMapWindow,{animated:true})

root.listDealsWindow.rightNavButton = mapButton

root.listDealsWindow.add(root.dealsTable)

root.dealsTable.addEventListener 'click', (e) ->
  Ti.API.error("PREVIO")
  if e.row.deal is undefined 
    root.tabGroup.activeTab.open(root.why3Window,{animated:true})
  else
    root.showDealView(e.row.deal)
    root.tabGroup.activeTab.open(root.oneDealWindow,{animated:true})
  Ti.API.error("NO HACE MAS")


# This will handle the JSON
root.xhrDeals = Titanium.Network.createHTTPClient()

root.xhrDeals.onload = () ->
  root.citiesWindow.remove(root.errorView)
  deals = JSON.parse(this.responseText)
  root.createMap(deals)
  data = []
  for deal in deals
    dealRow = new root.listDealsRow(deal)
    data.push(dealRow.row)
  if data.length is 0
    Ti.API.info '****** No hay hoteles activos en esta ciudad ********'
    root.listDealsWindow.add(root.noDealsView)
    root.noDealsView.show()
  else
    textRow = new root.GenericTextRow().row
    textRow.hasChild = true
    textRow.rightImage = '/images/blue_arrow.png'
    textLabel = Titanium.UI.createLabel
      text: L('why3Title')
      color: '#fff'
      font:
        fontSize: 14
        fontWeight: 'bold'
      left: 10
    textRow.add(textLabel)
    data.push(textRow)
    Ti.API.info '****** OK HAY HOTELES! ********'
    root.noDealsView.hide()
    root.listDealsWindow.remove(root.noDealsView)
    root.dealsTable.setData(data)
  root.hideLoading(root.listDealsWindow)
  root.showDeals()

root.xhrDeals.onerror = () ->
  Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:L('errorHappened')}).show()
  root.hideLoading(root.listDealsWindow)
  root.showError(root.citiesWindow)

root.loadDeals = (city) ->
  root.showLoading(root.listDealsWindow)
  root.city = city
  root.listDealsWindow.title = city.name
  root.xhrDeals.setTimeout(15000)
  root.xhrDeals.open('GET', root.url+'/deals/'+city.url)
  root.xhrDeals.setRequestHeader("Accept-Language",Titanium.Locale.currentLanguage)
  root.xhrDeals.send()

root.showDeals = () -> 
  if root.currentWindow isnt 'deals'
    root.tabGroup.activeTab.open(root.listDealsWindow,{animated:true})
  root.currentWindow = 'deals'
  




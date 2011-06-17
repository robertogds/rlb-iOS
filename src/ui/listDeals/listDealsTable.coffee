Ti.include('/js/listDealsMapView.js')
root.dealsTable = Titanium.UI.createTableView
  data: []
  backgroundColor: '#0b222e'
  separatorColor: '#0b222e'

mapButton = Titanium.UI.createButton
  title: 'Mapa'

mapButton.addEventListener 'click', (e) ->
  root.tabGroup.activeTab.open(root.listDealsMapWindow,{animated:true})

root.listDealsWindow.rightNavButton = mapButton

root.listDealsWindow.add(root.dealsTable)

root.dealsTable.addEventListener 'click', (e) ->
  root.showDealView(e.row.deal)
  root.tabGroup.activeTab.open(root.oneDealWindow,{animated:true})

# This will handle the JSON
root.xhrDeals = Titanium.Network.createHTTPClient()

root.xhrDeals.onload = () ->
  deals = JSON.parse(this.responseText)
  root.createMap(deals)
  data = []
  for deal in deals
    Ti.API.info deal
    dealRow = new root.listDealsRow(deal)
    data.push(dealRow.row)
  root.dealsTable.setData(data)
  root.listDealsWindow.remove(root.loadingView)

root.xhrDeals.onerror = () ->
  alert 'Se produjo un error. Inténtelo más tarde'
  root.listDealsWindow.remove(root.loadingView)
  #root.showError()

root.loadDeals = (city) ->
  root.listDealsWindow.title = city.name
  root.xhrDeals.open('GET', root.url+'/deals/'+city.url)
  root.xhrDeals.send()

root.showDeals = () ->
  root.tabGroup.activeTab.open(root.listDealsWindow,{animated:true})
  




Ti.include(
  'js/GenericWindow.js'
  'js/application.js'
  'js/ListDealsRow.js'
  'js/listDealsTable.js'
  'js/oneDealView.js'
  'js/accountView.js'
  'js/bookView.js'
  'js/testView.js'
)
# This will handle the JSON
xhrDeals = Titanium.Network.createHTTPClient()

xhrDeals.onload = () ->
  deals = JSON.parse(this.responseText)
  data = []
  for deal in deals
    dealRow = new root.listDealsRow(deal)
    data.push(dealRow.row)
  root.dealsTable.setData(data)

# This will pull the data from the webservice
xhrDeals.open('GET', 'http://rlb-back.appspot.com/deals')
xhrDeals.send()

root.listDealsWindow.win.add(root.dealsTable)
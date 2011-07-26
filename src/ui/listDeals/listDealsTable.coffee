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
  root.showDealView(e.row.deal)
  root.tabGroup.activeTab.open(root.oneDealWindow,{animated:true})

# Pull-Refresh

formatDate = () ->
  datestr = String.formatDate(new Date())
  timestr = String.formatTime(new Date())
  return datestr + ' ' + timestr

border = Ti.UI.createView
  backgroundColor:"#576c89"
  height:2
  bottom:0

tableHeader = Ti.UI.createView
  backgroundColor:"#e2e7ed"
  width:320
  height:60	

tableHeader.add(border)

arrow = Ti.UI.createView
  backgroundImage:"/images/whiteArrow.png",
  width:23
  height:60
  bottom:10
  left:20

statusLabel = Ti.UI.createLabel
  text:"Pull to reload"
  left:55
  width:200
  bottom:30
  height:"auto"
  color:"#576c89"
  textAlign:"center"
  font:{fontSize:13,fontWeight:"bold"}
  shadowColor:"#999"
  shadowOffset:{x:0,y:1}

lastUpdatedLabel = Ti.UI.createLabel
  text:"Last Updated: "+ formatDate()
  left:55
  width:200
  bottom:15
  height:"auto"
  color:"#576c89"
  textAlign:"center"
  font:{fontSize:12}
  shadowColor:"#999"
  shadowOffset:{x:0,y:1}

actInd = Titanium.UI.createActivityIndicator
  left:20
  bottom:13
  width:30
  height:30

tableHeader.add(arrow)
tableHeader.add(statusLabel)
tableHeader.add(lastUpdatedLabel)
tableHeader.add(actInd)



root.dealsTable.headerPullView = tableHeader

pulling = false
reloading = false

beginReloading = () ->
  #just mock out the reload
  root.loadDeals(root.city)
  setTimeout(endReloading,3000)

endReloading = () -> 
  reloading = false
  lastUpdatedLabel.text = L('lastUpdated')+': '+formatDate()
  statusLabel.text = L('pullRefresh')+'...'
  actInd.hide()
  arrow.show()


root.dealsTable.addEventListener 'scroll', (e) ->
  offset = e.contentOffset.y
  if (offset <= -65.0 && !pulling)
    t = Ti.UI.create2DMatrix()
    t = t.rotate(-180)
    pulling = true
    arrow.animate({transform:t,duration:180})
    statusLabel.text = L('releaseRefresh')+'...' 
  else if (pulling && offset > -65.0 && offset < 0)
    pulling = false
    t = Ti.UI.create2DMatrix()
    arrow.animate({transform:t,duration:180})
    statusLabel.text = L('pullRefresh')+'...'
  1

root.dealsTable.addEventListener 'scrollEnd', (e) ->
  if (pulling && !reloading && e.contentOffset.y <= -65.0)
    reloading = true
    pulling = false
    arrow.hide();
    actInd.show();
    statusLabel.text = L('reloading')+'...'
    arrow.transform=Ti.UI.create2DMatrix()
    beginReloading()
  1

# END Pull-Refresh

# This will handle the JSON
root.xhrDeals = Titanium.Network.createHTTPClient()

root.xhrDeals.onload = () ->
  deals = JSON.parse(this.responseText)
  root.createMap(deals)
  data = []
  for deal in deals
    #Ti.API.info deal
    dealRow = new root.listDealsRow(deal)
    data.push(dealRow.row)
  if data.length is 0
    root.noDealsView.show()
  else
    root.noDealsView.hide()
    root.dealsTable.setData(data)
  root.listDealsWindow.remove(root.loadingView)
  root.showDeals()

root.xhrDeals.onerror = () ->
  alert L('errorHappened')
  root.listDealsWindow.remove(root.loadingView)
  root.showError()

root.loadDeals = (city) ->
  root.listDealsWindow.add(root.loadingView)
  root.city = city
  root.listDealsWindow.title = city.name
  root.xhrDeals.open('GET', root.url+'/deals/'+city.url)
  root.xhrDeals.setRequestHeader("Accept-Language",Titanium.Locale.currentLanguage)
  root.xhrDeals.send()

root.showDeals = () -> 
  if root.currentWindow isnt 'deals'
    root.tabGroup.activeTab.open(root.listDealsWindow,{animated:true})
  root.currentWindow = 'deals'
  




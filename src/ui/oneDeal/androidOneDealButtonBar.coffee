root.oneDealButtonBarView = Titanium.UI.createView
  borderWidth: 0
  top: 0
  height: 40
  backgroundColor:'#000'

spacer = Math.round(Ti.Platform.displayCaps.platformWidth*0.25)
width = spacer-4

bookingTab = new root.GenericAndroidTab(width,'2','#333','#FFF',L('booking')).view
infoTab = new root.GenericAndroidTab(width,spacer,'#000','#FFF',L('info')).view
mapTab = new root.GenericAndroidTab(width,spacer*2,'#000','#FFF',L('map')).view
photosTab = new root.GenericAndroidTab(width,spacer*3,'#000','#FFF',L('photos')).view


currTab = bookingTab

root.oneDealButtonBarView.add(bookingTab)
root.oneDealButtonBarView.add(infoTab)
root.oneDealButtonBarView.add(mapTab)
root.oneDealButtonBarView.add(photosTab)


bookingTab.addEventListener 'click', (e) ->
  currTab.backgroundColor = '#000'
  #currTab.children[0].color = '#333'
  this.backgroundColor = '#333'
  this.children[0].color = '#FFF'
  currTab = this
  root.oneDealWindow.remove root.infoDealTable
  root.oneDealWindow.remove root.mapView
  root.oneDealWindow.add root.oneDealView

infoTab.addEventListener 'click', (e) ->
  currTab.backgroundColor = '#000'
  #currTab.children[0].color = '#333'
  this.backgroundColor = '#333'
  this.children[0].color = '#FFF'
  currTab = this
  root.oneDealWindow.remove root.oneDealView 
  root.oneDealWindow.remove root.mapView
  root.oneDealWindow.add root.infoDealTable

mapTab.addEventListener 'click', (e) ->
  currTab.backgroundColor = '#000'
  #currTab.children[0].color = '#333'
  this.backgroundColor = '#333'
  this.children[0].color = '#FFF'
  currTab = this
  root.oneDealWindow.remove root.oneDealView
  root.oneDealWindow.remove root.infoDealTable
  root.oneDealWindow.add root.mapView

photosTab.addEventListener 'click', (e) ->
  currTab.backgroundColor = '#000'
  this.backgroundColor = '#333'
  this.children[0].color = '#FFF'
  currTab = this
  root.imagesWindow.add(root.imagesScrollView)
  root.tabGroup.activeTab.open(root.imagesWindow,{animated:true})
  #root.imagesScrollView.scrollToView(root.image2)




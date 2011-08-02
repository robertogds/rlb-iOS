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
  alert 'hizo clik en Booking'

infoTab.addEventListener 'click', (e) ->
  alert 'hizo clik en Info'

mapTab.addEventListener 'click', (e) ->
  alert 'hizo clik en map'

photosTab.addEventListener 'click', (e) ->
  alert 'hizo clik en photos'




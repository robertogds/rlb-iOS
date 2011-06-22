root.listDealsMapView = Titanium.Map.createView
  mapType: Titanium.Map.STANDARD_TYPE
  top: 0
  width: 320
  height: 440
  animate: true
  regionFit: true
  userLocation: true

root.mbv = []

root.listDealsMapWindow.add(root.listDealsMapView)

root.createMap = (deals) -> 
  root.annotations = []
  region =
    latitudeDelta: 0.02
    longitudeDelta: 0.02
  a = 0
  for deal in deals
    region.latitude = deal.latitude
    region.longitude = deal.longitude
    subtitle = L('tonight') + ': ' + deal.salePriceCents + '€'
    root.mbv[a]  = new root.GenericMapRightButtonView(deal).view   
    root.mbv[a].addEventListener 'click', (e) ->
      root.showDealView(e.source.deal)
      root.tabGroup.activeTab.open(root.oneDealWindow,{animated:true})
    root.annotations[a] = new root.GenericMapAnnotation(deal.id,deal.latitude,deal.longitude,deal.hotelName,subtitle,root.mbv[a]).annotation
    root.listDealsMapView.addAnnotation(root.annotations[a])
    a++
  root.listDealsMapView.region = region
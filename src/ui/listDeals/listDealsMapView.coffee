root.listDealsMapView = Titanium.Map.createView
  mapType: Titanium.Map.STANDARD_TYPE
  top: 0
  width: 320
  height: 440
  animate: true
  regionFit: true
  userLocation: true

root.listDealsMapWindow.add(root.listDealsMapView)

root.createMap = (deals) -> 
  region =
    latitudeDelta: 0.05
    longitudeDelta: 0.05
  for deal in deals
    region.latitude = deal.latitude
    region.longitude = deal.longitude
    annotation = new root.GenericMapAnnotation(deal.id,deal.latitude,deal.longitude,deal.hotelName,deal.address).annotation
    root.listDealsMapView.addAnnotation(annotation)
  root.listDealsMapView.region = region
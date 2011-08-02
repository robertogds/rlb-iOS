mapButtonView = new root.GenericMapRightButtonView(null).view

mapButtonView.addEventListener 'click', (e) ->
  root.oneDealWindow.remove root.infoDealTable
  root.oneDealWindow.remove root.mapView
  root.oneDealWindow.add root.oneDealView
  #Ti.Platform.openURL("http://maps.google.com/maps?saddr="+root.hotelAnnotation.longitude+","+root.hotelAnnotation.longitude)

root.hotelAnnotation = Titanium.Map.createAnnotation
  title:""
  subtitle:''
  pincolor:Titanium.Map.ANNOTATION_RED
  animate:true
  rightView: mapButtonView
  myid:1 # CUSTOM ATTRIBUTE THAT IS PASSED INTO EVENT OBJECTS


root.mapView = Titanium.Map.createView
  mapType: Titanium.Map.STANDARD_TYPE
  top: 40
  width: '100%'
  height: '98%'
  region:
    latitudeDelta:0.01
    longitudeDelta:0.01
  animate: true
  regionFit: true
  userLocation: true
  #annotations: [root.hotelAnnotation]
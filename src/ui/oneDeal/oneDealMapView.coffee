root.hotelAnnotation = Titanium.Map.createAnnotation
  #latitude:40.41571353
  #longitude:-3.70623408
  #title:"Appcelerator Headquarters"
  #subtitle:'Mountain View, CA'
  pincolor:Titanium.Map.ANNOTATION_RED
  animate:true
  #leftButton: '../images/appcelerator_small.png'
  myid:1 # CUSTOM ATTRIBUTE THAT IS PASSED INTO EVENT OBJECTS

root.mapView = Titanium.Map.createView
  mapType: Titanium.Map.STANDARD_TYPE
  top: 25
  width: 320
  height: 455
  region:
    #latitude: 40.41571353
    #longitude: -3.70623408
    #latitude:37.390749
    #longitude:-122.081651
    latitudeDelta:0.01
    longitudeDelta:0.01
  animate: true
  regionFit: true
  userLocation: true
  #annotations: [root.hotelAnnotation]
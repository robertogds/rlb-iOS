(function() {
  root.hotelAnnotation = Titanium.Map.createAnnotation({
    pincolor: Titanium.Map.ANNOTATION_RED,
    animate: true,
    myid: 1
  });
  root.mapView = Titanium.Map.createView({
    mapType: Titanium.Map.STANDARD_TYPE,
    top: 40,
    width: 320,
    height: 440,
    region: {
      latitudeDelta: 0.01,
      longitudeDelta: 0.01
    },
    animate: true,
    regionFit: true,
    userLocation: true
  });
}).call(this);

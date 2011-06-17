(function() {
  root.hotelAnnotation = Titanium.Map.createAnnotation({
    title: "Appcelerator Headquarters",
    subtitle: 'Mountain View, CA',
    pincolor: Titanium.Map.ANNOTATION_RED,
    animate: true,
    myid: 10
  });
  root.hotel0Annotation = Titanium.Map.createAnnotation({
    pincolor: Titanium.Map.ANNOTATION_RED,
    animate: true,
    myid: 0
  });
  root.hotel1Annotation = Titanium.Map.createAnnotation({
    pincolor: Titanium.Map.ANNOTATION_RED,
    animate: true,
    myid: 1
  });
  root.hotel2Annotation = Titanium.Map.createAnnotation({
    pincolor: Titanium.Map.ANNOTATION_RED,
    animate: true,
    myid: 2
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

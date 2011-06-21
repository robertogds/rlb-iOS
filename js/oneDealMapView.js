(function() {
  var mapButtonView;
  mapButtonView = new root.GenericMapRightButtonView(null).view;
  mapButtonView.addEventListener('click', function(e) {
    root.oneDealWindow.remove(root.infoDealTable);
    root.oneDealWindow.remove(root.mapView);
    return root.oneDealWindow.add(root.oneDealView);
  });
  root.hotelAnnotation = Titanium.Map.createAnnotation({
    title: "Appcelerator Headquarters",
    subtitle: 'Mountain View, CA',
    pincolor: Titanium.Map.ANNOTATION_RED,
    animate: true,
    rightView: mapButtonView,
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

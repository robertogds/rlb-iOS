(function() {

  root.mapView = Titanium.Map.createView({
    mapType: Titanium.Map.STANDARD_TYPE,
    top: 40,
    width: '100%',
    height: '98%',
    region: {
      latitudeDelta: 0.01,
      longitudeDelta: 0.01
    },
    animate: true,
    regionFit: true,
    userLocation: true
  });

  root.createDealMap = function(deal) {
    var hotelAnnotation, mapButtonView, region, subtitle;
    root.mapView.removeAllAnnotations();
    mapButtonView = new root.GenericMapRightButtonView(null).view;
    mapButtonView.addEventListener('click', function(e) {
      Ti.API.info('Entra en mapButtonView click');
      root.oneDealWindow.remove(root.infoDealTable);
      root.oneDealWindow.remove(root.mapView);
      return root.oneDealWindow.add(root.oneDealView);
    });
    subtitle = L('tonight') + ': ' + deal.salePriceCents + '€';
    hotelAnnotation = new root.GenericMapAnnotation(deal.id, deal.latitude, deal.longitude, deal.hotelName, subtitle, mapButtonView).annotation;
    root.mapView.addAnnotation(hotelAnnotation);
    region = {
      latitude: deal.latitude,
      longitude: deal.longitude,
      latitudeDelta: 0.01,
      longitudeDelta: 0.01
    };
    root.mapView.region = region;
    root.mapView.setLocation(region);
    return root.oneDealWindow.remove(root.mapView);
  };

}).call(this);

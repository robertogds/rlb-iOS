(function() {
  root.listDealsMapView = Titanium.Map.createView({
    mapType: Titanium.Map.STANDARD_TYPE,
    top: 0,
    width: 320,
    height: 440,
    animate: true,
    regionFit: true,
    userLocation: true
  });
  root.listDealsMapWindow.add(root.listDealsMapView);
  root.createMap = function(deals) {
    var annotation, deal, region, _i, _len;
    region = {
      latitudeDelta: 0.05,
      longitudeDelta: 0.05
    };
    for (_i = 0, _len = deals.length; _i < _len; _i++) {
      deal = deals[_i];
      region.latitude = deal.latitude;
      region.longitude = deal.longitude;
      annotation = new root.GenericMapAnnotation(deal.id, deal.latitude, deal.longitude, deal.hotelName, deal.address).annotation;
      root.listDealsMapView.addAnnotation(annotation);
    }
    return root.listDealsMapView.region = region;
  };
}).call(this);

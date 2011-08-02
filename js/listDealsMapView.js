(function() {
  root.listDealsMapView = Titanium.Map.createView({
    mapType: Titanium.Map.STANDARD_TYPE,
    top: 0,
    width: '100%',
    height: '98%',
    animate: true,
    regionFit: true,
    userLocation: true
  });
  root.mbv = [];
  root.listDealsMapWindow.add(root.listDealsMapView);
  root.createMap = function(deals) {
    var a, deal, region, subtitle, _i, _len;
    root.annotations = [];
    region = {
      latitudeDelta: 0.02,
      longitudeDelta: 0.02
    };
    a = 0;
    for (_i = 0, _len = deals.length; _i < _len; _i++) {
      deal = deals[_i];
      region.latitude = deal.latitude;
      region.longitude = deal.longitude;
      subtitle = L('tonight') + ': ' + deal.salePriceCents + '€';
      root.mbv[a] = new root.GenericMapRightButtonView(deal).view;
      root.mbv[a].addEventListener('click', function(e) {
        root.showDealView(e.source.deal);
        return root.tabGroup.activeTab.open(root.oneDealWindow, {
          animated: true
        });
      });
      root.annotations[a] = new root.GenericMapAnnotation(deal.id, deal.latitude, deal.longitude, deal.hotelName, subtitle, root.mbv[a]).annotation;
      root.listDealsMapView.addAnnotation(root.annotations[a]);
      a++;
    }
    return root.listDealsMapView.region = region;
  };
}).call(this);

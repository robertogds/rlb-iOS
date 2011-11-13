(function() {
  Ti.include('/js/why3View.js', '/js/ListDealsRow.js', '/js/listDealsMapView.js', '/js/listDealsTable.js', '/js/noDealsView.js');
  if (Titanium.Platform.name !== 'android') {
    Ti.include('/js/pullRefresh.js');
  }
  root.listDealsWindow.addEventListener('focus', function(e) {});
}).call(this);

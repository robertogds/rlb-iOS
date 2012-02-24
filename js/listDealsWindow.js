(function() {

  Ti.include('/js/DealHeaderView.js', '/js/why3View.js', '/js/ListDealsRow.js', '/js/listDealsTable.js', '/js/noDealsView.js');

  if (Titanium.Platform.name !== 'android') Ti.include('/js/pullRefresh.js');

}).call(this);

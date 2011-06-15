(function() {
  Ti.include('/js/GenericWindow.js', '/js/Generic2RowsView.js', '/js/GenericTextView.js', '/js/application.js', '/js/accountWindow.js', '/js/bookingsWindow.js', '/js/ListDealsRow.js', '/js/listDealsTable.js', '/js/oneDealView.js', '/js/oneBookingView.js', '/js/loadingView.js', '/js/accountView.js', '/js/testView.js', '/js/configView.js', '/js/bookingView.js', '/js/citiesTable.js', '/js/errorView.js');
  if (Titanium.App.Properties.hasProperty("user")) {
    root.user = JSON.parse(Titanium.App.Properties.getString("user"));
  }
  root.showCities();
}).call(this);

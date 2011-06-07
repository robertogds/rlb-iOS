(function() {
  Ti.include('js/GenericWindow.js', 'js/Generic2RowsView.js', 'js/application.js', 'js/accountWindow.js', 'js/ListDealsRow.js', 'js/listDealsTable.js', 'js/oneDealView.js', 'js/loadingView.js', 'js/accountView.js', 'js/bookView.js', 'js/testView.js', 'js/configView.js', 'js/citiesTable.js');
  root.userEmail = Titanium.App.Properties.getString("userEmail");
  root.showCities();
}).call(this);

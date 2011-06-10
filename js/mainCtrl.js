(function() {
  Ti.include('js/GenericWindow.js', 'js/Generic2RowsView.js', 'js/application.js', 'js/accountWindow.js', 'js/ListDealsRow.js', 'js/listDealsTable.js', 'js/oneDealView.js', 'js/loadingView.js', 'js/accountView.js', 'js/listBooksView.js', 'js/testView.js', 'js/configView.js', 'js/bookingView.js', 'js/citiesTable.js');
  if (Titanium.App.Properties.hasProperty("user")) {
    root.user = JSON.parse(Titanium.App.Properties.getString("user"));
  }
  if (Titanium.Network.online === false) {
    alert('Para usar esta aplicacion debes tener conexion a internet');
  } else {
    root.showCities();
  }
}).call(this);

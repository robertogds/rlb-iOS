(function() {
  Ti.include('/js/citiesRow.js');
  root.citiesTable = Titanium.UI.createTableView({
    data: [],
    backgroundColor: '#0b222e',
    separatorColor: '#0b222e'
  });
  root.citiesWindow.add(root.citiesTable);
  root.citiesTable.addEventListener('click', function(e) {
    root.listDealsWindow.add(root.loadingView);
    root.loadDeals(e.row.city);
    return root.showDeals();
  });
  root.xhrCities = Titanium.Network.createHTTPClient();
  root.xhrCities.onload = function() {
    var cities, city, cityRow, data, _i, _len;
    cities = JSON.parse(this.responseText);
    data = [];
    for (_i = 0, _len = cities.length; _i < _len; _i++) {
      city = cities[_i];
      cityRow = new root.citiesRow(city);
      data.push(cityRow.row);
    }
    root.citiesTable.setData(data);
    return root.citiesWindow.remove(root.loadingView);
  };
  root.xhrCities.onerror = function() {
    alert('Se produjo un error');
    root.citiesWindow.remove(root.loadingView);
    return root.showError();
  };
  root.xhrCities.timedOut = function() {
    return alert('Se produjo un timeout. Intentelo más tarde');
  };
  root.showCities = function() {
    if (Titanium.Network.online === false) {
      alert('Para usar esta aplicacion debes tener conexion a internet');
      return root.showError();
    } else {
      root.citiesWindow.add(root.loadingView);
      root.xhrCities.open('GET', root.url + '/cities');
      return root.xhrCities.send();
    }
  };
}).call(this);

(function() {
  var footerView;
  footerView = Titanium.UI.createView({
    backgroundColor: '#0d1e28',
    borderWidth: 0,
    height: 100
  });
  root.citiesTable = Titanium.UI.createTableView({
    data: [],
    backgroundColor: '#0d1e28',
    separatorColor: '#1b3c50',
    footerView: footerView
  });
  root.citiesWindow.add(root.citiesTable);
  root.citiesTable.addEventListener('click', function(e) {
    root.citiesWindow.add(root.loadingView);
    return root.loadDeals(e.row.city);
  });
  root.xhrCities = Titanium.Network.createHTTPClient();
  root.xhrCities.onload = function() {
    var cities, city, cityRow, data, _i, _len;
    root.citiesWindow.remove(root.errorView);
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
    Ti.API.info("Entra en error de ciudades onerror");
    root.citiesWindow.remove(root.loadingView);
    return root.showError(root.citiesWindow);
  };
  root.showCities = function() {
    if (Titanium.Network.online === false) {
      Ti.API.info("Entra en no hay internet");
      alert(L('mustInternet'));
      return root.showError(root.citiesWindow);
    } else {
      root.xhrCities.setTimeout(8000);
      root.citiesWindow.add(root.loadingView);
      root.xhrCities.open('GET', root.url + '/cities');
      root.xhrCities.setRequestHeader("Accept-Language", Titanium.Locale.currentLanguage);
      return root.xhrCities.send();
    }
  };
}).call(this);

(function() {
  Ti.include('js/citiesRow.js');
  root.citiesTable = Titanium.UI.createTableView({
    data: [],
    backgroundColor: '#093b4e',
    separatorColor: '#093b4e'
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
  root.showCities = function() {
    root.citiesWindow.add(root.loadingView);
    root.xhrCities.open('GET', 'http://rlb-back.appspot.com/cities');
    return root.xhrCities.send();
  };
}).call(this);

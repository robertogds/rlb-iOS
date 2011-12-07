(function() {
  var citiesData, city, cityColumn, gpsButton, list, n, _i, _len, _ref;
  root.citiesTable = Titanium.UI.createTableView({
    data: [],
    backgroundColor: 'transparent',
    separatorColor: 'transparent'
  });
  root.citiesWindow.add(root.citiesTable);
  gpsButton = Titanium.UI.createButton({
    title: 'GPS'
  });
  gpsButton.addEventListener('click', function(e) {
    return root.initializeGPS();
  });
  root.citiesWindow.rightNavButton = gpsButton;
  root.citiesTable.addEventListener('click', function(e) {
    if (e.row.city !== void 0) {
      Ti.API.info('Entra en click a ciudad');
      Titanium.Analytics.featureEvent('click.city', {
        city: e.row.city.name
      });
      root.showLoading(root.citiesWindow, L('updatingHotels'));
      return root.loadDeals(e.row.city);
    }
  });
  citiesData = [];
  n = 0;
  list = {};
  _ref = root.staticCities;
  for (_i = 0, _len = _ref.length; _i < _len; _i++) {
    city = _ref[_i];
    n++;
    list[n] = city;
    if (n === 3) {
      cityColumn = new root.cityColumn(list[1], list[2], list[3]);
      citiesData.push(cityColumn.row);
      n = 0;
      list[1] = void 0;
      list[2] = void 0;
      list[3] = void 0;
    }
  }
  cityColumn = new root.cityColumn(list[1], list[2], list[3]);
  citiesData.push(cityColumn.row);
  root.citiesTable.setData(citiesData);
}).call(this);

(function() {
  var city, cityRow, gpsButton, list, n, _i, _len, _ref;

  root.citiesTable = Titanium.UI.createTableView({
    data: [],
    backgroundColor: 'transparent',
    separatorColor: 'transparent'
  });

  if (Titanium.Platform.name === 'android') {
    root.citiesTable.setData([
      Ti.UI.createTableViewRow({
        title: 'Loading...'
      })
    ]);
  }

  root.citiesWindow.add(root.citiesTable);

  gpsButton = Titanium.UI.createButton({
    title: 'GPS'
  });

  gpsButton.addEventListener('click', function(e) {
    return root.initializeGPS();
  });

  root.citiesWindow.rightNavButton = gpsButton;

  root.citiesData = [];

  n = 0;

  list = {};

  _ref = root.staticCities;
  for (_i = 0, _len = _ref.length; _i < _len; _i++) {
    city = _ref[_i];
    n++;
    list[n] = city;
    if (n === 3) {
      cityRow = new root.cityRow(list[1], list[2], list[3]);
      root.citiesData.push(cityRow.row);
      n = 0;
      list[1] = void 0;
      list[2] = void 0;
      list[3] = void 0;
    }
  }

  root.citiesTable.setData(root.citiesData);

}).call(this);

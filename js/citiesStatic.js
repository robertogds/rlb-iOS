(function() {
  var city, cityRow, gpsButton, list, mainCitiesSection, n, otherCitiesSection, _i, _j, _len, _len2, _ref, _ref2;

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

  mainCitiesSection = Ti.UI.createTableViewSection({
    headerTitle: L('main_cities')
  });

  otherCitiesSection = Ti.UI.createTableViewSection({
    headerTitle: L('more_cities')
  });

  _ref = root.staticCities;
  for (_i = 0, _len = _ref.length; _i < _len; _i++) {
    city = _ref[_i];
    n++;
    list[n] = city;
    if (n === 3) {
      cityRow = new root.cityRow(list[1], list[2], list[3]);
      mainCitiesSection.add(cityRow.row);
      n = 0;
      list[1] = void 0;
      list[2] = void 0;
      list[3] = void 0;
    }
  }

  n = 0;

  _ref2 = root.staticOtherCities;
  for (_j = 0, _len2 = _ref2.length; _j < _len2; _j++) {
    city = _ref2[_j];
    n++;
    list[n] = city;
    if (n === 3) {
      cityRow = new root.cityRow(list[1], list[2], list[3]);
      otherCitiesSection.add(cityRow.row);
      n = 0;
      list[1] = void 0;
      list[2] = void 0;
      list[3] = void 0;
    }
  }

  root.citiesData.push(mainCitiesSection);

  root.citiesData.push(otherCitiesSection);

  root.citiesTable.setData(root.citiesData);

}).call(this);

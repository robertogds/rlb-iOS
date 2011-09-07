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
    root.showLoading(root.citiesWindow);
    return root.loadDeals(e.row.city);
  });
  root.xhrCities = Titanium.Network.createHTTPClient();
  root.xhrCities.onload = function() {
    var cities, city, cityRow, data, textLabel, textRow, _i, _len;
    root.citiesWindow.remove(root.errorView);
    cities = JSON.parse(this.responseText);
    data = [];
    textRow = new root.GenericTextRow().row;
    textRow.backgroundGradient = {
      type: 'linear',
      colors: [
        {
          color: '#07151d',
          position: 0.1
        }, {
          color: '#07151d',
          position: 1.0
        }
      ]
    };
    textLabel = Titanium.UI.createLabel({
      text: L('citiesToday'),
      color: '#fff',
      font: {
        fontSize: 12
      },
      left: 10
    });
    textRow.add(textLabel);
    data.push(textRow);
    for (_i = 0, _len = cities.length; _i < _len; _i++) {
      city = cities[_i];
      cityRow = new root.citiesRow(city);
      data.push(cityRow.row);
    }
    root.citiesTable.setData(data);
    return root.hideLoading(root.citiesWindow);
  };
  root.xhrCities.onerror = function() {
    Ti.API.info("Entra en error de ciudades onerror");
    root.hideLoading(root.citiesWindow);
    return root.showError(root.citiesWindow);
  };
  root.showCities = function() {
    if (Titanium.Network.online === false) {
      Ti.API.info("Entra en no hay internet");
      Ti.UI.createAlertDialog({
        title: 'ReallyLateBooking',
        message: L('mustInternet')
      }).show();
      return root.showError(root.citiesWindow);
    } else {
      root.xhrCities.setTimeout(15000);
      root.showLoading(root.citiesWindow);
      root.xhrCities.open('GET', root.url + '/cities');
      root.xhrCities.setRequestHeader("Accept-Language", Titanium.Locale.currentLanguage);
      return root.xhrCities.send();
    }
  };
}).call(this);

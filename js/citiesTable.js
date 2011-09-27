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
    if (e.row.city !== void 0) {
      root.showLoading(root.citiesWindow, L('updatingHotels'));
      return root.loadDeals(e.row.city);
    }
  });
  root.xhrCities = Titanium.Network.createHTTPClient();
  root.xhrCities.onload = function() {
    var cities, city, cityRow, data, textLabel, textRow, _i, _len;
    root.citiesWindow.remove(root.errorView);
    Ti.API.info("Paso1");
    Ti.API.info(this.responseText);
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
      left: 10,
      width: '90%'
    });
    textRow.add(textLabel);
    data.push(textRow);
    for (_i = 0, _len = cities.length; _i < _len; _i++) {
      city = cities[_i];
      cityRow = new root.citiesRow(city);
      data.push(cityRow.row);
    }
    root.citiesTable.setData(data);
    root.hideLoading(root.citiesWindow);
    return Ti.API.info("showCities Paso 6 FIN");
  };
  root.xhrCities.onerror = function() {
    Ti.API.info("Entra en error de ciudades onerror");
    root.hideLoading(root.citiesWindow);
    return root.showError(root.citiesWindow);
  };
  root.showCities = function() {
    Ti.API.info("Entra en showCities");
    if (Titanium.Network.online === false) {
      Ti.API.info("Entra en no hay internet");
      Ti.UI.createAlertDialog({
        title: 'ReallyLateBooking',
        message: L('mustInternet')
      }).show();
      return root.showError(root.citiesWindow);
    } else {
      root.xhrCities.setTimeout(15000);
      Ti.API.info("showCities pasa timeout");
      root.showLoading(root.citiesWindow);
      root.xhrCities.open('GET', root.url + '/cities');
      root.xhrCities.setRequestHeader("Accept-Language", Titanium.Locale.currentLanguage);
      root.xhrCities.send();
      return Ti.API.info("showCities hace llamada");
    }
  };
}).call(this);

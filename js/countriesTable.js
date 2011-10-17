(function() {
  var footerView;
  footerView = Titanium.UI.createView({
    backgroundColor: '#0d1e28',
    borderWidth: 0,
    height: 100
  });
  root.countriesTable = Titanium.UI.createTableView({
    data: [],
    backgroundColor: '#0d1e28',
    separatorColor: '#1b3c50',
    footerView: footerView
  });
  root.countriesWindow.add(root.countriesTable);
  root.countriesTable.addEventListener('click', function(e) {
    if (e.row.country !== void 0) {
      root.showLoading(root.countriesWindow);
      root.showCities(e.row.country.url);
      return root.country = e.row.country.url;
    }
  });
  root.xhrCountries = Titanium.Network.createHTTPClient();
  root.xhrCountries.onload = function() {
    var countries, country, countryRow, data, _i, _len;
    root.countriesWindow.remove(root.errorView);
    Ti.API.info(this.responseText);
    countries = JSON.parse(this.responseText);
    data = [];
    for (_i = 0, _len = countries.length; _i < _len; _i++) {
      country = countries[_i];
      countryRow = new root.countriesRow(country);
      data.push(countryRow.row);
    }
    root.countriesTable.setData(data);
    return root.hideLoading(root.countriesWindow);
  };
  root.xhrCountries.onerror = function() {
    root.hideLoading(root.countriesWindow);
    return root.showError(root.countriesWindow);
  };
  root.showCountries = function() {
    if (Titanium.Network.online === false) {
      Ti.UI.createAlertDialog({
        title: 'ReallyLateBooking',
        message: L('mustInternet')
      }).show();
      return root.showError(root.countriesWindow);
    } else {
      root.xhrCountries.setTimeout(15000);
      root.showLoading(root.countriesWindow);
      root.xhrCountries.open('GET', root.url + '/countries');
      root.xhrCountries.setRequestHeader("Accept-Language", Titanium.Locale.currentLanguage);
      return root.xhrCountries.send();
    }
  };
}).call(this);

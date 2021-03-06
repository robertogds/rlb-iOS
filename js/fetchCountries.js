(function() {

  root.countriesDate = new Date();

  root.listCountries = void 0;

  root.xhrCountries = Titanium.Network.createHTTPClient();

  root.xhrCountries.onload = function() {
    Ti.API.info(this.responseText);
    root.listCountries = JSON.parse(this.responseText);
    root.populateCountriesTable(root.listCountries);
    if (root.isGPS) return root.gpsFetchCities();
  };

  root.xhrCountries.onerror = function() {
    root.hideLoading(root.countriesWindow);
    return root.showError(root.countriesWindow);
  };

  root.fetchCountries = function() {
    var diffTime, now;
    if (Titanium.Network.online === false) {
      Ti.UI.createAlertDialog({
        title: 'ReallyLateBooking',
        message: L('mustInternet')
      }).show();
      return root.showError(root.countriesWindow);
    } else {
      now = new Date();
      diffTime = now.getTime() - root.countriesDate.getTime();
      Ti.API.info('last countries updated: ' + root.countriesDate.toLocaleDateString() + 'difftime: ' + diffTime);
      if (root.listCountries === void 0 || diffTime > 86400000 || root.listCountries.length === 0) {
        Ti.API.info('Fetch the list of Countries calling internet');
        root.xhrCountries.setTimeout(15000);
        root.showLoading(root.countriesWindow);
        root.xhrCountries.open('GET', root.url + '/countries');
        root.xhrCountries.setRequestHeader("Accept-Language", Titanium.Locale.currentLanguage);
        return root.xhrCountries.send();
      } else {
        Ti.API.info('Not necceseary call internet for fetching Countries');
        return root.populateCountriesTable(root.listCountries);
      }
    }
  };

}).call(this);

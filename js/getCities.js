(function() {
  root.citiesDate = new Date();
  root.listCities = void 0;
  root.xhrCities = Titanium.Network.createHTTPClient();
  root.xhrCities.onload = function() {
    root.citiesDate = new Date();
    root.listCities = JSON.parse(this.responseText);
    Ti.API.info(this.responseText);
    alert(root.listCities.length);
    return root.populateCitiesTable(root.listCities);
  };
  root.xhrCities.onerror = function() {
    Ti.API.info("Entra en error de ciudades onerror");
    root.hideLoading(root.citiesWindow);
    return root.showError(root.citiesWindow);
  };
  root.getCities = function(url) {
    var diffTime, now;
    if (Titanium.Network.online === false) {
      Ti.UI.createAlertDialog({
        title: 'ReallyLateBooking',
        message: L('mustInternet')
      }).show();
      return root.showError(root.citiesWindow);
    } else {
      now = new Date();
      diffTime = now.getTime() - root.citiesDate.getTime();
      Ti.API.info('last cities updated: ' + root.citiesDate.toLocaleDateString() + 'difftime: ' + diffTime);
      if (root.listCities === void 0 || diffTime > 86400000) {
        root.xhrCities.setTimeout(15000);
        root.xhrCities.open('GET', root.url + '/cities/' + url);
        root.xhrCities.setRequestHeader("Accept-Language", Titanium.Locale.currentLanguage);
        return root.xhrCities.send();
      } else {
        return root.populateCitiesTable(root.listCities);
      }
    }
  };
}).call(this);

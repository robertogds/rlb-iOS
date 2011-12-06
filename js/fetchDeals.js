(function() {
  root.xhrDeals = Titanium.Network.createHTTPClient();
  root.xhrDeals.onload = function() {
    var deals;
    Ti.API.info("en fetchdeals obtenemos: " + this.responseText);
    root.hideLoading(root.citiesWindow);
    deals = JSON.parse(this.responseText);
    if (deals.status === void 0) {
      Ti.API.error("Entra en undefined OK");
      return root.populateDealsTable(deals);
    }
  };
  root.xhrDeals.onerror = function() {
    root.hideLoading(root.citiesWindow);
    Ti.UI.createAlertDialog({
      title: 'ReallyLateBooking',
      message: L('errorHappened')
    }).show();
    root.hideLoading(root.listDealsWindow);
    return root.showError(root.citiesWindow);
  };
  root.fetchDeals = function(city) {
    if (Titanium.Network.online === false) {
      Ti.UI.createAlertDialog({
        title: 'ReallyLateBooking',
        message: L('mustInternet')
      }).show();
      return root.showError(root.citiesWindow);
    } else {
      root.xhrDeals.setTimeout(15000);
      root.xhrDeals.open('GET', root.url + '/deals/' + city.url);
      root.xhrDeals.setRequestHeader("Accept-Language", Titanium.Locale.currentLanguage);
      return root.xhrDeals.send();
    }
  };
  root.fetchDealsFake = function() {
    var deals;
    deals = [
      {
        'hotelName': 'Petit Palace Embassy',
        'salePriceCents': 140,
        'roomType': 'lujo',
        'priceCents': 250
      }, {
        'hotelName': 'Hotel Regina',
        'salePriceCents': 135,
        'roomType': 'elegante',
        'priceDay2': 110,
        'priceCents': 200
      }, {
        'hotelName': 'Vincci Soho',
        'salePriceCents': 120,
        'roomType': 'confort',
        'priceCents': 180
      }
    ];
    return root.populateDealsTable(deals);
  };
}).call(this);

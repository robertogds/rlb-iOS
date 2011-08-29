(function() {
  var mapButton;
  root.dealsTable = Titanium.UI.createTableView({
    data: [],
    backgroundColor: '#0d1e28',
    separatorColor: '#1b3c50'
  });
  mapButton = Titanium.UI.createButton({
    title: 'Mapa'
  });
  mapButton.addEventListener('click', function(e) {
    root.listDealsMapView.annotations = root.annotations;
    return root.tabGroup.activeTab.open(root.listDealsMapWindow, {
      animated: true
    });
  });
  root.listDealsWindow.rightNavButton = mapButton;
  root.listDealsWindow.add(root.dealsTable);
  root.dealsTable.addEventListener('click', function(e) {
    Ti.API.error("PREVIO");
    if (e.row.deal === void 0) {
      root.tabGroup.activeTab.open(root.why3Window, {
        animated: true
      });
    } else {
      root.showDealView(e.row.deal);
      root.tabGroup.activeTab.open(root.oneDealWindow, {
        animated: true
      });
    }
    return Ti.API.error("NO HACE MAS");
  });
  root.xhrDeals = Titanium.Network.createHTTPClient();
  root.xhrDeals.onload = function() {
    var data, deal, dealRow, deals, textLabel, textRow, _i, _len;
    root.citiesWindow.remove(root.errorView);
    deals = JSON.parse(this.responseText);
    root.createMap(deals);
    data = [];
    for (_i = 0, _len = deals.length; _i < _len; _i++) {
      deal = deals[_i];
      dealRow = new root.listDealsRow(deal);
      data.push(dealRow.row);
    }
    if (data.length === 0) {
      Ti.API.info('****** No hay hoteles activos en esta ciudad ********');
      root.listDealsWindow.add(root.noDealsView);
      root.noDealsView.show();
    } else {
      textRow = new root.GenericTextRow().row;
      textRow.hasChild = true;
      textRow.rightImage = '/images/blue_arrow.png';
      textLabel = Titanium.UI.createLabel({
        text: L('why3Title'),
        color: '#fff',
        font: {
          fontSize: 14,
          fontWeight: 'bold'
        },
        left: 10
      });
      textRow.add(textLabel);
      data.push(textRow);
      Ti.API.info('****** OK HAY HOTELES! ********');
      root.noDealsView.hide();
      root.listDealsWindow.remove(root.noDealsView);
      root.dealsTable.setData(data);
    }
    root.hideLoading(root.listDealsWindow);
    return root.showDeals();
  };
  root.xhrDeals.onerror = function() {
    Ti.UI.createAlertDialog({
      title: 'ReallyLateBooking',
      message: L('errorHappened')
    }).show();
    root.hideLoading(root.listDealsWindow);
    return root.showError(root.citiesWindow);
  };
  root.loadDeals = function(city) {
    root.showLoading(root.listDealsWindow);
    root.city = city;
    root.listDealsWindow.title = city.name;
    root.xhrDeals.setTimeout(5000);
    root.xhrDeals.open('GET', root.url + '/deals/' + city.url);
    root.xhrDeals.setRequestHeader("Accept-Language", Titanium.Locale.currentLanguage);
    return root.xhrDeals.send();
  };
  root.showDeals = function() {
    if (root.currentWindow !== 'deals') {
      root.tabGroup.activeTab.open(root.listDealsWindow, {
        animated: true
      });
    }
    return root.currentWindow = 'deals';
  };
}).call(this);

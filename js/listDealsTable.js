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
    root.showDealView(e.row.deal);
    root.tabGroup.activeTab.open(root.oneDealWindow, {
      animated: true
    });
    return Ti.API.error("NO HACE MAS");
  });
  root.xhrDeals = Titanium.Network.createHTTPClient();
  root.xhrDeals.onload = function() {
    var data, deal, dealRow, deals, _i, _len;
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
      root.listDealsWindow.add(root.noDealsView);
      root.noDealsView.show();
    } else {
      root.noDealsView.hide();
      root.listDealsWindow.remove(root.noDealsView);
      root.dealsTable.setData(data);
    }
    root.listDealsWindow.remove(root.loadingView);
    return root.showDeals();
  };
  root.xhrDeals.onerror = function() {
    alert(L('errorHappened'));
    root.listDealsWindow.remove(root.loadingView);
    return root.showError(root.citiesWindow);
  };
  root.loadDeals = function(city) {
    root.listDealsWindow.add(root.loadingView);
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

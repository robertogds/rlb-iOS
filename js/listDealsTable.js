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
    root.showDealView(e.row.deal);
    return root.tabGroup.activeTab.open(root.oneDealWindow, {
      animated: true
    });
  });
  root.xhrDeals = Titanium.Network.createHTTPClient();
  root.xhrDeals.onload = function() {
    var data, deal, dealRow, deals, _i, _len;
    deals = JSON.parse(this.responseText);
    root.createMap(deals);
    data = [];
    for (_i = 0, _len = deals.length; _i < _len; _i++) {
      deal = deals[_i];
      Ti.API.info(deal);
      dealRow = new root.listDealsRow(deal);
      data.push(dealRow.row);
    }
    if (data.length === 0) {
      root.noDealsView.show();
    } else {
      root.noDealsView.hide();
      root.dealsTable.setData(data);
    }
    return root.listDealsWindow.remove(root.loadingView);
  };
  root.xhrDeals.onerror = function() {
    alert('Se produjo un error. Inténtelo más tarde');
    root.listDealsWindow.remove(root.loadingView);
    return root.showError();
  };
  root.loadDeals = function(city) {
    root.listDealsWindow.title = city.name;
    root.xhrDeals.open('GET', root.url + '/deals/' + city.url);
    root.xhrDeals.setRequestHeader("Accept-Language", Titanium.Locale.currentLanguage);
    return root.xhrDeals.send();
  };
  root.showDeals = function() {
    return root.tabGroup.activeTab.open(root.listDealsWindow, {
      animated: true
    });
  };
}).call(this);

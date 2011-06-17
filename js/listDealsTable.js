(function() {
  var mapButton;
  Ti.include('/js/listDealsMapView.js');
  root.dealsTable = Titanium.UI.createTableView({
    data: [],
    backgroundColor: '#0b222e',
    separatorColor: '#0b222e'
  });
  mapButton = Titanium.UI.createButton({
    title: 'Mapa'
  });
  mapButton.addEventListener('click', function(e) {
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
    root.dealsTable.setData(data);
    return root.listDealsWindow.remove(root.loadingView);
  };
  root.xhrDeals.onerror = function() {
    alert('Se produjo un error. Inténtelo más tarde');
    return root.listDealsWindow.remove(root.loadingView);
  };
  root.loadDeals = function(city) {
    root.listDealsWindow.title = city.name;
    root.xhrDeals.open('GET', root.url + '/deals/' + city.url);
    return root.xhrDeals.send();
  };
  root.showDeals = function() {
    return root.tabGroup.activeTab.open(root.listDealsWindow, {
      animated: true
    });
  };
}).call(this);

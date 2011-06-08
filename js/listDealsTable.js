(function() {
  root.dealsTable = Titanium.UI.createTableView({
    data: [],
    backgroundColor: '#0b222e',
    separatorColor: '#0b222e'
  });
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
    data = [];
    for (_i = 0, _len = deals.length; _i < _len; _i++) {
      deal = deals[_i];
      dealRow = new root.listDealsRow(deal);
      data.push(dealRow.row);
    }
    root.dealsTable.setData(data);
    return root.listDealsWindow.remove(root.loadingView);
  };
  root.loadDeals = function(city) {
    root.listDealsWindow.title = city.name;
    root.xhrDeals.open('GET', 'http://rlb-back.appspot.com/deals/' + city.url);
    return root.xhrDeals.send();
  };
  root.showDeals = function() {
    return root.tabGroup.activeTab.open(root.listDealsWindow, {
      animated: true
    });
  };
}).call(this);

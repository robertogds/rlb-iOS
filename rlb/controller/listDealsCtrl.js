(function() {
  var xhrDeals;
  xhrDeals = Titanium.Network.createHTTPClient();
  xhrDeals.onload = function() {
    var data, deal, dealRow, deals, _i, _len;
    deals = JSON.parse(this.responseText);
    data = [];
    for (_i = 0, _len = deals.length; _i < _len; _i++) {
      deal = deals[_i];
      dealRow = new root.listDealsRow(deal);
      data.push(dealRow.row);
    }
    return root.dealsTable.setData(data);
  };
  xhrDeals.open('GET', 'http://rlb-back.appspot.com/deals');
  xhrDeals.send();
  root.listDealsWindow.win.add(root.dealsTable);
}).call(this);

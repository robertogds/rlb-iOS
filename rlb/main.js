(function() {
  var xhrDeals;
  root.tabGroup = Titanium.UI.createTabGroup({
    barColor: '#336699'
  });
  Titanium.UI.setBackgroundColor('#000');
  root.dealsWindow = new root.GenericWindow('Madrid', 'Cargando Ofertas Disponibles...');
  root.bookWindow = new root.GenericWindow('Tus Reservas', 'Página de reservas');
  root.configWindow = new root.GenericWindow('Configuración', 'Página de configuración');
  root.mainTabs = new root.MainTabs();
  root.tabGroup.addTab(root.mainTabs.dealsTab);
  root.tabGroup.addTab(root.mainTabs.bookTab);
  root.tabGroup.addTab(root.mainTabs.tabConfig);
  root.tabGroup.open();
  root.dealsWindow.win.add(root.dealsTable);
  xhrDeals = Titanium.Network.createHTTPClient();
  xhrDeals.onload = function() {
    var data, deal, dealRow, deals, _i, _len;
    deals = JSON.parse(this.responseText);
    data = [];
    for (_i = 0, _len = deals.length; _i < _len; _i++) {
      deal = deals[_i];
      dealRow = new root.RowDeal(deal);
      data.push(dealRow.row);
    }
    return root.dealsTable.setData(data);
  };
  xhrDeals.open('GET', 'http://rlb-back.appspot.com/deals');
  xhrDeals.send();
}).call(this);

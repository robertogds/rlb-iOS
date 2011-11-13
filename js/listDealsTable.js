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
  root.reloadDeals = false;
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
  root.populateDealsTable = function(deals) {
    var data, deal, dealRow, id, textLabel, textRow, _i, _len;
    id = 0;
    root.citiesWindow.remove(root.errorView);
    root.createMap(deals);
    Ti.API.info('deals: ' + this.responseText);
    data = [];
    for (_i = 0, _len = deals.length; _i < _len; _i++) {
      deal = deals[_i];
      id = id + 1;
      Ti.API.info('Entra en un deal' + id);
      dealRow = new root.listDealsRow(deal, id);
      Ti.API.info('antes de hacer el data.push');
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
      Ti.API.info('Metimos why3');
      textRow.add(textLabel);
      Ti.API.info('hace textlabel');
      data.push(textRow);
      Ti.API.info('****** OK HAY HOTELES! ********');
      root.noDealsView.hide();
      root.listDealsWindow.remove(root.noDealsView);
      root.dealsTable.setData(data);
    }
    root.hideLoading(root.listDealsWindow);
    root.hideLoading(root.citiesWindow);
    if (root.reloadDeals === false) {
      root.tabGroup.activeTab.open(root.listDealsWindow, {
        animated: true
      });
    }
    root.reloadDeals = false;
    return Ti.API.error('TERMINA CARGA DEALS');
  };
  root.loadDeals = function(city) {
    Ti.API.info('Entra en loadDeals');
    root.showLoading(root.listDealsWindow, L('updatingHotels'));
    root.city = city;
    root.listDealsWindow.title = city.name;
    return root.fetchDeals(city);
  };
}).call(this);

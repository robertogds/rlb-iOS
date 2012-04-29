(function() {
  var mapButton, textLabel;

  root.dealsTable = Titanium.UI.createTableView({
    data: [
      Ti.UI.createTableViewRow({
        title: 'Loading...'
      })
    ],
    backgroundColor: '#0d1e28',
    separatorColor: '#1b3c50'
  });

  if (root.isAndroid) {
    root.dealsTable.setData([
      Ti.UI.createTableViewRow({
        title: 'Loading...'
      })
    ]);
  } else {
    mapButton = Titanium.UI.createButton;
    ({
      title: 'Mapa'
    });
    mapButton.addEventListener('click', function(e) {
      root.listDealsMapView.annotations = root.annotations;
      return root.tabGroup.activeTab.open(root.listDealsMapWindow, {
        animated: true
      });
    });
    root.listDealsWindow.rightNavButton = mapButton;
  }

  root.listDealsWindow.add(root.dealsTable);

  root.reloadDeals = false;

  root.why3Row = new root.GenericTextRow().row;

  root.why3Row.hasChild = true;

  root.why3Row.rightImage = '/images/blue_arrow.png';

  textLabel = Titanium.UI.createLabel({
    text: L('why3Title'),
    color: '#fff',
    font: {
      fontSize: 14,
      fontWeight: 'bold'
    },
    left: 10
  });

  root.why3Row.add(textLabel);

  root.dealsTable.addEventListener('click', function(e) {
    if (e.row.deal === void 0) {
      return root.tabGroup.activeTab.open(root.why3Window, {
        animated: true
      });
    } else {
      root.showDealView(e.row.deal);
      return root.tabGroup.activeTab.open(root.oneDealWindow, {
        animated: true
      });
    }
  });

  root.showDeals = function(deals) {
    Ti.API.info("Entra en showDeals: " + deals.length);
    root.citiesWindow.remove(root.errorView);
    if (deals.length === 0) {
      Ti.API.info('****** No hay hoteles activos en esta ciudad ********');
      root.tabGroup.activeTab.open(root.noDealsWindow, {
        animated: true
      });
      root.hideLoading(root.listDealsWindow);
      root.hideLoading(root.citiesWindow);
      Ti.API.info('Termina');
    } else {
      Ti.API.info('*** Entra en hay hoteles');
      root.dealsTable.setData([
        Ti.UI.createTableViewRow({
          title: 'Loading...'
        })
      ]);
      Ti.API.info('*** Paso 1');
      root.tabGroup.activeTab.open(root.listDealsWindow, {
        animated: true
      });
      Ti.API.info('*** Paso 2');
      if (root.isAndroid === false) root.createMap(deals);
      root.populateDealsZoneTable(deals);
    }
    return Ti.API.info('*** Sale de showDeals');
  };

  root.populateDealsTable = function(deals) {
    var deal, dealRow, _i, _len;
    Ti.API.info('*** Entra en populateDealsTable');
    root.dealsData = [];
    for (_i = 0, _len = deals.length; _i < _len; _i++) {
      deal = deals[_i];
      dealRow = new root.listDealsRow(deal);
      root.dealsData.push(dealRow.row);
    }
    root.dealsData.push(root.why3Row);
    return root.endPopulate();
  };

  root.populateDealsZoneTable = function(deals) {
    var city, deal, dealRow, first, header, name, section, _i, _len;
    Ti.API.info('*** Entra en populate Zonas ');
    root.zoneUrl = 'null';
    root.dealsData = [];
    name = "empty";
    first = true;
    for (_i = 0, _len = deals.length; _i < _len; _i++) {
      deal = deals[_i];
      city = deal.city;
      Ti.API.info('Entra con name = ' + name + ' city.name = ' + city.name + ' city.url = ' + city.url + ' zone.url = ' + root.zoneUrl);
      dealRow = new root.listDealsRow(deal);
      if (city.name !== name && city.url !== root.zoneUrl) {
        if (first !== true) root.dealsData.push(section);
        header = new root.dealHeaderView(L(city.url));
        Ti.API.info('City url = ' + city.url);
        section = Ti.UI.createTableViewSection({
          headerView: header.view
        });
        name = city.name;
        section.add(dealRow.row);
        first = false;
      } else if (city.url !== root.zoneUrl) {
        section.add(dealRow.row);
      }
    }
    root.dealsData.push(section);
    root.dealsData.push(root.why3Row);
    root.endPopulate();
    return Ti.API.info('*** fin populateDealsZoneTable');
  };

  root.endPopulate = function() {
    Ti.API.info('*** Entra enPopulate');
    root.hideLoading(root.listDealsWindow);
    root.hideLoading(root.citiesWindow);
    root.dealsTable.setData(root.dealsData);
    return Ti.API.info('*** FIN enPopulate');
  };

  root.loadDeals = function(city) {
    Ti.API.info('Entra en loadDeals');
    root.showLoading(root.listDealsWindow, L('updatingHotels'));
    root.city = city;
    root.listDealsWindow.title = city.name;
    root.noDealsWindow.title = city.name;
    return root.fetchDeals(city);
  };

}).call(this);

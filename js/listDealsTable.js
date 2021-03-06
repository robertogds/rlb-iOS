(function() {
  var mapButton, textLabel;

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
    left: 10,
    height: 30
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
    } else {
      root.createMap(deals);
      if (root.cityHasZones(deals)) {
        root.populateDealsZoneTable(deals);
      } else {
        root.populateDealsTable(deals);
      }
    }
    return Ti.API.info('*** Sale de showDeals');
  };

  root.cityHasZones = function(deals) {
    var deal, lastName, zonas, _i, _len;
    lastName = "null";
    zonas = 0;
    for (_i = 0, _len = deals.length; _i < _len; _i++) {
      deal = deals[_i];
      if (deal.city.name !== lastName) zonas++;
      lastName = deal.city.name;
    }
    if (zonas > 1) {
      return true;
    } else {
      return false;
    }
  };

  root.populateDealsTable = function(deals) {
    var data, deal, dealRow, _i, _len;
    Ti.API.info('*** Entra en populateDealsTable');
    data = [];
    for (_i = 0, _len = deals.length; _i < _len; _i++) {
      deal = deals[_i];
      dealRow = new root.listDealsRow(deal);
      data.push(dealRow.row);
    }
    data.push(root.why3Row);
    root.dealsTable.setData(data);
    Ti.API.info('*** LLama a EndPopulate');
    return root.endPopulate();
  };

  root.populateDealsZoneTable = function(deals) {
    var city, data, deal, dealRow, first, header, lastName, section, _i, _len;
    Ti.API.info('*** Entra en populate Zonas ');
    data = [];
    lastName = "empty";
    first = true;
    section = Titanium.UI.createTableViewSection();
    for (_i = 0, _len = deals.length; _i < _len; _i++) {
      deal = deals[_i];
      city = deal.city;
      dealRow = new root.listDealsRow(deal);
      if (city.name !== lastName) {
        Ti.API.info('Entra en CABECERA');
        if (first !== true) data.push(section);
        header = new root.dealHeaderView(city.name);
        first = false;
        section = Titanium.UI.createTableViewSection({
          headerView: header.view
        });
      }
      section.add(dealRow.row);
      lastName = city.name;
    }
    data.push(section);
    data.push(root.why3Row);
    root.dealsTable.setData(data);
    root.endPopulate();
    return Ti.API.info('*** fin populateDealsZoneTable');
  };

  root.endPopulate = function() {
    Ti.API.info('Entra en endPopulate');
    root.hideLoading(root.listDealsWindow);
    root.hideLoading(root.citiesWindow);
    if (root.reloadDeals === false) {
      Ti.API.info('*** Entra en abrir ventana');
      root.tabGroup.activeTab.open(root.listDealsWindow, {
        animated: true
      });
    }
    root.reloadDeals = false;
    return Ti.API.info('Fin endPopulate');
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

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
      root.listDealsWindow.add(root.noDealsView);
      root.noDealsView.show();
      root.endPopulate();
      return Ti.API.info('Termina');
    } else {
      root.createMap(deals);
      if (root.city.hasZones === true) {
        return root.populateDealsZoneTable(deals);
      } else {
        return root.populateDealsTable(deals);
      }
    }
  };

  root.populateDealsTable = function(deals) {
    var data, deal, dealRow, _i, _len;
    data = [];
    for (_i = 0, _len = deals.length; _i < _len; _i++) {
      deal = deals[_i];
      dealRow = new root.listDealsRow(deal);
      data.push(dealRow.row);
    }
    data.push(root.why3Row);
    root.noDealsView.hide();
    root.listDealsWindow.remove(root.noDealsView);
    root.dealsTable.setData(data);
    return root.endPopulate();
  };

  root.populateDealsZoneTable = function(deals) {
    var city, data, deal, dealRow, first, firstName, header, name, section, _i, _j, _len, _len2;
    data = [];
    name = "empty";
    first = true;
    for (_i = 0, _len = deals.length; _i < _len; _i++) {
      deal = deals[_i];
      city = deal.city;
      alert(city.url);
      if (city.url === root.zoneUrl) {
        if (first === true) {
          header = new root.dealHeaderView('');
          section = Ti.UI.createTableViewSection({
            headerView: header.view
          });
          first = false;
        }
        header.textLabel.text = L(city.url);
        dealRow = new root.listDealsRow(deal);
        section.add(dealRow.row);
        name = city.name;
        firstName = city.name;
      }
    }
    for (_j = 0, _len2 = deals.length; _j < _len2; _j++) {
      deal = deals[_j];
      city = deal.city;
      dealRow = new root.listDealsRow(deal);
      if (city.name !== name && city.url !== root.zoneUrl) {
        data.push(section);
        header = new root.dealHeaderView(L(city.url));
        section = Ti.UI.createTableViewSection({
          headerView: header.view
        });
        name = city.name;
        section.add(dealRow.row);
      } else if (city.url !== root.zoneUrl) {
        section.add(dealRow.row);
      }
    }
    data.push(section);
    data.push(root.why3Row);
    root.noDealsView.hide();
    root.listDealsWindow.remove(root.noDealsView);
    root.dealsTable.setData(data);
    return root.endPopulate(false);
  };

  root.endPopulate = function() {
    root.hideLoading(root.listDealsWindow);
    root.hideLoading(root.citiesWindow);
    if (root.reloadDeals === false) {
      root.tabGroup.activeTab.open(root.listDealsWindow, {
        animated: true
      });
    }
    return root.reloadDeals = false;
  };

  root.loadDeals = function(city) {
    Ti.API.info('Entra en loadDeals');
    root.showLoading(root.listDealsWindow, L('updatingHotels'));
    root.city = city;
    root.listDealsWindow.title = city.name;
    return root.fetchDeals(city);
  };

}).call(this);

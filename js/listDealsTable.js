(function() {
  var textLabel;

  root.dealsTable = Titanium.UI.createTableView({
    data: [],
    backgroundColor: '#0d1e28',
    separatorColor: '#1b3c50'
  });

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
      Ti.API.info('*** Entra en hay hoteles');
      if (root.city.hasZones === true) {
        return root.populateDealsZoneTable(deals);
      } else {
        return root.populateDealsTable(deals);
      }
    }
  };

  root.populateDealsTable = function(deals) {
    var data, deal, dealRow, _i, _len;
    root.dealsTable.setData(void 0);
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
    var city, data, deal, dealRow, first, header, name, section, _i, _len;
    root.dealsTable.setData(void 0);
    Ti.API.info('*** Entra en populate Zonas ' + root.dealsTable);
    root.zoneUrl = 'null';
    data = [];
    name = "empty";
    first = true;
    for (_i = 0, _len = deals.length; _i < _len; _i++) {
      deal = deals[_i];
      city = deal.city;
      dealRow = new root.listDealsRow(deal);
      if (city.name !== name && city.url !== root.zoneUrl) {
        data.push(section);
        header = new root.dealHeaderView(L(city.url));
        section = Ti.UI.createTableViewSection({
          headerView: header.view,
          headerTitle: L(city.url)
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

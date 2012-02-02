(function() {
  var footerView;

  footerView = Titanium.UI.createView({
    backgroundColor: 'transparent',
    borderWidth: 0,
    height: 100
  });

  root.citiesTable = Titanium.UI.createTableView({
    data: [],
    backgroundColor: 'transparent',
    separatorColor: 'transparent',
    footerView: footerView
  });

  root.citiesWindow.add(root.citiesTable);

  root.citiesTable.addEventListener('click', function(e) {
    if (e.row.city !== void 0) {
      Ti.API.info('Entra en click a ciudad');
      root.showLoading(root.citiesWindow, L('updatingHotels'));
      return root.loadDeals(e.row.city);
    }
  });

  root.populateCitiesTable = function(cities) {
    var city, cityRow, data, textLabel, textRow, _i, _len;
    root.citiesWindow.remove(root.errorView);
    data = [];
    textRow = new root.GenericTextRow().row;
    textRow.backgroundGradient = {
      type: 'linear',
      colors: [
        {
          color: '#07151d',
          position: 0.1
        }, {
          color: '#07151d',
          position: 1.0
        }
      ]
    };
    textLabel = Titanium.UI.createLabel({
      text: L('citiesToday'),
      color: '#fff',
      font: {
        fontSize: 12
      },
      left: 10,
      width: '90%'
    });
    textRow.add(textLabel);
    data.push(textRow);
    for (_i = 0, _len = cities.length; _i < _len; _i++) {
      city = cities[_i];
      cityRow = new root.citiesRow(city);
      data.push(cityRow.row);
    }
    root.citiesTable.setData(data);
    root.hideLoading(root.countriesWindow);
    return root.hideLoading(root.citiesWindow);
  };

}).call(this);

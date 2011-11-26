(function() {
  root.citiesTable = Titanium.UI.createTableView({
    data: [],
    backgroundImage: '/images/texture1.jpg',
    separatorColor: 'transparent'
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
    var city, cityColumn, data, list, n, _i, _len;
    root.citiesWindow.remove(root.errorView);
    data = [];
    n = 0;
    list = {};
    for (_i = 0, _len = cities.length; _i < _len; _i++) {
      city = cities[_i];
      n++;
      list[n] = city;
      if (n === 3) {
        cityColumn = new root.cityColumn(list[1], list[2], list[3]);
        data.push(cityColumn.row);
        n = 0;
      }
    }
    root.citiesTable.setData(data);
    root.hideLoading(root.countriesWindow);
    root.hideLoading(root.citiesWindow);
    return root.tabGroup.activeTab.open(root.citiesWindow, {
      animated: true
    });
  };
}).call(this);

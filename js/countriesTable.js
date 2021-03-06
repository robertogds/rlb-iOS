(function() {
  var footerView;

  footerView = Titanium.UI.createView({
    backgroundColor: '#0d1e28',
    borderWidth: 0,
    height: 100
  });

  root.countriesTable = Titanium.UI.createTableView({
    data: [],
    backgroundColor: '#0d1e28',
    separatorColor: '#1b3c50',
    footerView: footerView
  });

  root.countriesWindow.add(root.countriesTable);

  root.countriesTable.addEventListener('click', function(e) {
    if (e.row.country !== void 0) {
      root.showLoading(root.countriesWindow);
      root.fetchCities(e.row.country.url);
      return root.country = e.row.country.url;
    }
  });

  root.populateCountriesTable = function(countries) {
    var country, countryRow, data, _i, _len;
    root.countriesWindow.remove(root.errorView);
    data = [];
    for (_i = 0, _len = countries.length; _i < _len; _i++) {
      country = countries[_i];
      countryRow = new root.countriesRow(country);
      data.push(countryRow.row);
    }
    root.countriesTable.setData(data);
    return root.hideLoading(root.countriesWindow);
  };

}).call(this);

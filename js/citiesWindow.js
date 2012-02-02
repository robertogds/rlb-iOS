(function() {

  Ti.include('/js/citiesRow.js', '/js/zoneCell.js', '/js/cityCell.js', '/js/cityRow.js', '/js/citiesStatic.js');

  root.deactivateCells = function(cityName) {
    var otherCity, _i, _len, _ref, _results;
    _ref = root.staticCities;
    _results = [];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      otherCity = _ref[_i];
      if (otherCity.name !== cityName) {
        _results.push(root.cell[otherCity.name].inactiveView.visible = true);
      } else {
        _results.push(void 0);
      }
    }
    return _results;
  };

  root.activateCells = function() {
    var cell, otherCity, rowToDelete, _i, _len, _ref;
    _ref = root.staticCities;
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      otherCity = _ref[_i];
      cell = root.cell[otherCity.name];
      cell.inactiveView.visible = false;
      if (cell.cityImage.open === true) {
        rowToDelete = cell.cityImage.city.row + 1;
        cell.cityImage.open = false;
      }
    }
    return root.citiesTable.deleteRow(rowToDelete);
  };

}).call(this);

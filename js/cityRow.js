(function() {
  var CityRow;

  CityRow = (function() {

    function CityRow(city1, city2, city3) {
      this.row = Ti.UI.createTableViewRow({
        height: 107,
        hasChild: false,
        selectionStyle: 'none',
        backgroundColor: 'transparent'
      });
      root.cell[city1.name] = new root.cityCell(this.row, city1, 0);
      if (city2 !== void 0) {
        root.cell[city2.name] = new root.cityCell(this.row, city2, 107);
      }
      if (city3 !== void 0) {
        root.cell[city3.name] = new root.cityCell(this.row, city3, 214);
      }
    }

    return CityRow;

  })();

  root.cityRow = CityRow;

}).call(this);

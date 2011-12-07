(function() {
  var CityColumn;
  CityColumn = (function() {
    function CityColumn(city1, city2, city3) {
      var row1, row2, row3;
      this.row = Ti.UI.createTableViewRow({
        height: 107,
        hasChild: false,
        selectionStyle: 'none',
        backgroundColor: 'transparent'
      });
      row1 = new root.cityRow(this.row, city1, 0);
      if (city2 !== void 0) {
        row2 = new root.cityRow(this.row, city2, 107);
      }
      if (city3 !== void 0) {
        row3 = new root.cityRow(this.row, city3, 214);
      }
    }
    return CityColumn;
  })();
  root.cityColumn = CityColumn;
}).call(this);

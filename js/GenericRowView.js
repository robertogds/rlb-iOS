(function() {
  var GenericRowView;
  GenericRowView = (function() {
    function GenericRowView(top, text) {
      var data, row, section, table;
      this.view = Titanium.UI.createView({
        background: 'transparent',
        top: top
      });
      table = Titanium.UI.createTableView({
        top: 10,
        height: 40,
        width: 300,
        borderWidth: 0,
        borderRadius: 10,
        scrollable: false,
        moving: false
      });
      this.label = Titanium.UI.createLabel({
        borderWidth: 0,
        text: text,
        color: '#000',
        left: 8,
        font: {
          fontSize: 15,
          fontWeight: 'bold'
        }
      });
      section = Titanium.UI.createTableViewSection();
      data = [];
      row = Titanium.UI.createTableViewRow({
        hasChild: true
      });
      row.add(this.label);
      section.add(row);
      data[0] = section;
      table.data = data;
      this.view.add(table);
    }
    return GenericRowView;
  })();
  root.GenericRowView = GenericRowView;
}).call(this);

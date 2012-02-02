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
        top: 0,
        height: 40,
        width: '95%',
        borderWidth: 0,
        borderRadius: 10,
        scrollable: false,
        moving: false,
        backgroundColor: '#fff'
      });
      this.label = Titanium.UI.createLabel({
        width: '100%',
        height: '100%',
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
        hasChild: true,
        width: '100%',
        height: 44
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

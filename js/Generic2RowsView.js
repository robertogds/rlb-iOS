(function() {
  var Generic2RowsView;

  Generic2RowsView = (function() {

    function Generic2RowsView(top, text1, text2) {
      var data, row1, row2, section;
      this.view = Titanium.UI.createView({
        background: 'transparent',
        top: top
      });
      this.table = Titanium.UI.createTableView({
        top: 0,
        height: 88,
        width: '95%',
        borderWidth: 0,
        borderRadius: 10,
        scrollable: false,
        moving: false,
        backgroundColor: '#fff'
      });
      this.label1 = Titanium.UI.createLabel({
        width: '100%',
        height: '100%',
        borderWidth: 0,
        text: text1,
        color: '#000',
        backgroundColor: '#fff',
        left: 8,
        font: {
          fontSize: 15,
          fontWeight: 'bold'
        }
      });
      this.label2 = Titanium.UI.createLabel({
        width: '100%',
        height: '100%',
        text: text2,
        color: '#000',
        backgroundColor: '#fff',
        left: 8,
        font: {
          fontSize: 15,
          fontWeight: 'bold'
        }
      });
      section = Titanium.UI.createTableViewSection();
      data = [];
      row1 = Titanium.UI.createTableViewRow({
        hasChild: true,
        width: '100%',
        height: 44
      });
      row1.add(this.label1);
      row2 = Titanium.UI.createTableViewRow({
        hasChild: true,
        width: '100%',
        height: 44
      });
      row2.add(this.label2);
      section.add(row1);
      section.add(row2);
      data[0] = section;
      this.table.data = data;
      this.view.add(this.table);
    }

    return Generic2RowsView;

  })();

  root.Generic2RowsView = Generic2RowsView;

}).call(this);

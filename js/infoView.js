(function() {
  var InfoView;
  InfoView = (function() {
    function InfoView(top, text1, text2) {
      var data, label1, label2, row1, row2, section, table;
      this.view = Titanium.UI.createView({
        background: 'transparent',
        top: top
      });
      table = Titanium.UI.createTableView({
        top: 10,
        height: 85,
        width: 300,
        borderWidth: 0,
        borderRadius: 10,
        scrollable: false,
        moving: false
      });
      label1 = Titanium.UI.createLabel({
        borderWidth: 0,
        text: text1,
        color: '#000',
        left: 8,
        font: {
          fontSize: 15,
          fontWeight: 'bold'
        }
      });
      label2 = Titanium.UI.createLabel({
        borderWidth: 0,
        text: text2,
        color: '#000',
        left: 8,
        font: {
          fontSize: 15,
          fontWeight: 'bold'
        }
      });
      section = Titanium.UI.createTableViewSection();
      data = [];
      row1 = Titanium.UI.createTableViewRow({
        hasChild: true
      });
      row1.add(label1);
      row2 = Titanium.UI.createTableViewRow({
        hasChild: true
      });
      row2.add(label2);
      section.add(row1);
      section.add(row2);
      data[0] = section;
      table.data = data;
      this.view.add(table);
    }
    return InfoView;
  })();
  root.InfoView = InfoView;
}).call(this);
(function() {
  root.infoScrollView = Titanium.UI.createScrollView({
    contentWidth: 'auto',
    contentHeight: 'auto',
    top: 25,
    showVerticalScrollIndicator: true
  });
  root.infoView = Titanium.UI.createView({
    background: 'transparent',
    borderWidth: 0,
    width: 320,
    height: 620,
    top: 0
  });
  root.whyLabel = Titanium.UI.createLabel({
    top: 10,
    color: '#fff',
    left: 5,
    width: 315,
    height: 200,
    font: {
      fontSize: 14
    }
  });
  root.infoView.add(root.whyLabel);
  root.infoScrollView.add(root.infoView);
}).call(this);
',
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

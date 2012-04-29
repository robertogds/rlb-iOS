(function() {

  root.infoDealTable = Titanium.UI.createTableView({
    data: [
      Ti.UI.createTableViewRow({
        title: 'Loading...'
      })
    ],
    backgroundColor: '#0d1e28',
    separatorColor: '#1b3c50',
    top: 40
  });

  root.infoDealView = Titanium.UI.createView({
    backgroundColor: 'orange',
    top: 0,
    height: 40,
    width: 320,
    text: 'soy la caña'
  });

}).call(this);

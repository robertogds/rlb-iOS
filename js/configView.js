(function() {
  var acercaView, customerView, legalView, versionLabel;
  Ti.include('/js/supportView.js');
  root.configView = Titanium.UI.createView({
    background: 'transparent',
    borderWidth: 0,
    width: 320,
    top: 0
  });
  versionLabel = Titanium.UI.createLabel({
    borderWidth: 0,
    text: 'Version: ' + Titanium.App.version,
    color: '#fff',
    textAlign: 'center',
    font: {
      fontSize: 14
    },
    height: 30,
    width: 300,
    top: 300
  });
  customerView = new root.Generic2RowsView(10, 'Soporte a usuario', 'Danos tu opinión').view;
  acercaView = new root.Generic2RowsView(20, 'Acerca de ReallyLateBooking', 'Para los Hoteles').view;
  legalView = new root.Generic2RowsView(150, 'Términos de uso', 'Política de privacidad').view;
  root.configView.add(acercaView);
  root.configView.add(legalView);
  root.configView.add(versionLabel);
  root.configWindow.add(root.configView);
}).call(this);

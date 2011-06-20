(function() {
  var acercaView, legalView, versionLabel;
  Ti.include('/js/supportView.js');
  root.optionsView = Titanium.UI.createView({
    background: 'transparent',
    borderWidth: 0,
    width: 320,
    top: 0
  });
  versionLabel = Titanium.UI.createLabel({
    borderWidth: 0,
    text: 'Version: ' + Titanium.App.version,
    color: '#868d92',
    textAlign: 'center',
    font: {
      fontSize: 14
    },
    height: 30,
    width: 300,
    top: 300
  });
  acercaView = new root.Generic2RowsView(20, 'Acerca de ReallyLateBooking', 'Para los Hoteles');
  legalView = new root.Generic2RowsView(150, 'Términos de uso', 'Política de privacidad');
  acercaView.label1.addEventListener('click', function(e) {
    return root.tabGroup.activeTab.open(root.aboutWindow, {
      animated: true
    });
  });
  acercaView.label2.addEventListener('click', function(e) {
    return root.tabGroup.activeTab.open(root.forHotelsWindow, {
      animated: true
    });
  });
  legalView.label1.addEventListener('click', function(e) {
    return root.showTerms();
  });
  legalView.label2.addEventListener('click', function(e) {
    return root.showPrivacy();
  });
  root.optionsView.add(acercaView.view);
  root.optionsView.add(legalView.view);
  root.optionsView.add(versionLabel);
  root.optionsWindow.add(root.optionsView);
}).call(this);

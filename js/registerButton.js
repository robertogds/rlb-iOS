(function() {
  root.registerButton = Titanium.UI.createButton({
    borderWidth: 1,
    borderColor: 'red',
    backgroundImage: 'images/BUTT_gry_off.png',
    backgroundSelectedImage: 'images/BUTT_gry_on.png',
    backgroundDisabledImage: 'images/BUTT_drk_off.png',
    color: '#000',
    title: 'Registrarme',
    width: 220,
    height: 40,
    font: {
      fontSize: 20,
      fontWeight: 'bold',
      fontFamily: 'Helvetica Neue'
    },
    top: 290
  });
  root.registerButton.addEventListener('click', function(e) {
    alert('haces click');
    root.newAccountData[0] = root.newAccountSection;
    root.newAccountTable.data = root.newAccountData;
    root.newAccountView.add(root.newAccountTable);
    root.newAccountWindow.add(root.newAccountView);
    return root.tabGroup.activeTab.open(root.newAccountWindow, {
      animated: true
    });
  });
}).call(this);

(function() {
  var loginLabel, needLabel, rememberPassRowView;
  Ti.include('/js/registerButton.js', '/js/newAccountView.js', '/js/loginAction.js', '/js/logoutAction.js', '/js/facebookButton.js', '/js/loginTable.js', '/js/rememberPassView.js');
  root.loginView = Titanium.UI.createView({
    background: "transparent",
    borderWidth: 0,
    width: 320,
    height: 300,
    top: 10
  });
  loginLabel = Titanium.UI.createLabel({
    borderWidth: 0,
    text: "¿Ya eres usuario? Identificate",
    color: '#fff',
    left: 5,
    font: {
      fontSize: 14,
      fontWeight: 'bold'
    },
    height: 30,
    width: 300,
    top: 5
  });
  rememberPassRowView = new root.GenericRowView(170, 'He olvidado mi contraseña');
  rememberPassRowView.label.addEventListener('click', function(e) {
    return root.tabGroup.activeTab.open(root.rememberPassWindow, {
      animated: true
    });
  });
  root.loginView.add(rememberPassRowView.view);
  needLabel = Titanium.UI.createLabel({
    borderWidth: 0,
    text: "¿Necesitas una cuenta? Regístrate gratis",
    color: '#fff',
    left: 5,
    font: {
      fontSize: 14,
      fontWeight: 'bold'
    },
    height: 30,
    width: 300,
    top: 250
  });
  root.loginView.add(root.loginTable);
  root.loginView.add(needLabel);
  root.loginView.add(loginLabel);
  root.loginView.add(root.registerButton);
}).call(this);

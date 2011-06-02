(function() {
  var data, loginLabel, loginTable, needLabel, passText, row1, row2, section, userText;
  Ti.include('js/registerButton.js', 'js/facebookButton.js', 'js/newAccountView.js');
  root.accountView = Titanium.UI.createView({
    backgroundImage: 'images/background1.png',
    width: 320
  });
  root.loginView = Titanium.UI.createView({
    background: "transparent",
    borderWidth: 0,
    width: 300,
    height: 300,
    top: 70
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
    top: 1
  });
  userText = Titanium.UI.createTextField({
    color: '#336699',
    hintText: 'Usuario',
    clearOnEdit: true,
    paddingLeft: 10,
    suppressReturn: 1,
    keyboardType: Titanium.UI.KEYBOARD_DEFAULT,
    returnKeyType: Titanium.UI.RETURNKEY_NEXT
  });
  userText.addEventListener('return', function(e) {
    return passText.focus();
  });
  passText = Titanium.UI.createTextField({
    color: '#336699',
    hintText: 'Clave',
    paddingLeft: 10,
    clearOnEdit: true,
    passwordMask: true
  });
  root.xhrLogin = Titanium.Network.createHTTPClient();
  root.xhrLogin.onreadystatechange = function() {
    var results;
    try {
      if (this.readyState === 4) {
        results = JSON.parse(this.responseText);
      }
    } catch (e) {
      Ti.API.debug(e.error);
      alert('salio con error');
    }
    return 1;
  };
  root.xhrLogin.onload = function() {
    return alert(this.responseText);
  };
  passText.addEventListener('return', function(e) {
    var pass, user;
    user = userText.value;
    pass = passText.value;
    root.xhrLogin.open("POST", "http://rlb-back.appspot.com/users/login");
    root.xhrLogin.setTimeout(10);
    root.xhrLogin.setRequestHeader("Content-Type", "application/json; charset=utf-8");
    root.xhrLogin.send(JSON.stringify({
      "email": "roberto@iipir.com",
      "password": "iipir11"
    }));
    alert('salio');
    return 1;
  });
  loginTable = Titanium.UI.createTableView({
    top: 35,
    height: 85,
    width: 300,
    borderWidth: 0,
    borderRadius: 10,
    scrollable: false,
    moving: false
  });
  section = Titanium.UI.createTableViewSection();
  data = [];
  row1 = Titanium.UI.createTableViewRow();
  row1.add(userText);
  row2 = Titanium.UI.createTableViewRow();
  row2.add(passText);
  section.add(row1);
  section.add(row2);
  data[0] = section;
  loginTable.data = data;
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
    top: 150
  });
  root.loginView.add(loginTable);
  root.loginView.add(needLabel);
  root.loginView.add(loginLabel);
  root.loginView.add(root.registerButton);
  root.accountView.add(root.loginView);
  root.accountView.add(root.facebookButton);
  root.accountWindow.add(root.accountView);
}).call(this);

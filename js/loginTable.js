(function() {
  var data, emailText, passText, row1, row2, section;
  root.loginTable = Titanium.UI.createTableView({
    top: 60,
    height: 85,
    width: 300,
    borderWidth: 0,
    borderRadius: 10,
    scrollable: false,
    moving: false
  });
  emailText = Titanium.UI.createTextField({
    color: '#336699',
    hintText: 'Email',
    clearOnEdit: true,
    paddingLeft: 10,
    suppressReturn: 1,
    keyboardType: Titanium.UI.KEYBOARD_EMAIL,
    returnKeyType: Titanium.UI.RETURNKEY_NEXT
  });
  emailText.addEventListener('return', function(e) {
    return passText.focus();
  });
  passText = Titanium.UI.createTextField({
    color: '#336699',
    hintText: 'Clave',
    paddingLeft: 10,
    clearOnEdit: true,
    passwordMask: true
  });
  passText.addEventListener('return', function(e) {
    var email, password, validate;
    email = emailText.value;
    password = passText.value;
    validate = root.validateLoginData(email, password);
    if (validate === true) {
      password = Titanium.Utils.md5HexDigest(password);
      return root.doLogin(email, password);
    } else {
      return alert('Revisa los datos: ' + validate);
    }
  });
  section = Titanium.UI.createTableViewSection();
  data = [];
  row1 = Titanium.UI.createTableViewRow();
  row1.add(emailText);
  row2 = Titanium.UI.createTableViewRow();
  row2.add(passText);
  section.add(row1);
  section.add(row2);
  data[0] = section;
  root.loginTable.data = data;
}).call(this);

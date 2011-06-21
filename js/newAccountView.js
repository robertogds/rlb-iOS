(function() {
  var acceptLegalLabel, emailRow, emailText, firstNameRow, firstNameText, lastNameRow, lastNameText, newAccountButton, passwordRow, passwordText;
  Ti.include('/js/newAccountAction.js');
  root.newAccountView = Titanium.UI.createView({
    backgroundColor: 'transparent',
    width: 320
  });
  root.newAccountTable = Titanium.UI.createTableView({
    top: 20,
    height: 175,
    width: 300,
    borderWidth: 0,
    borderRadius: 10,
    scrollable: false,
    moving: false
  });
  firstNameText = Titanium.UI.createTextField({
    color: '#336699',
    hintText: 'Nombre',
    clearOnEdit: false,
    paddingLeft: 10,
    returnKeyType: Titanium.UI.RETURNKEY_NEXT
  });
  firstNameText.addEventListener('return', function(e) {
    return lastNameText.focus();
  });
  lastNameText = Titanium.UI.createTextField({
    color: '#336699',
    hintText: 'Apellidos',
    clearOnEdit: false,
    paddingLeft: 10,
    returnKeyType: Titanium.UI.RETURNKEY_NEXT
  });
  lastNameText.addEventListener('return', function(e) {
    return emailText.focus();
  });
  emailText = Titanium.UI.createTextField({
    color: '#336699',
    hintText: 'Email',
    clearOnEdit: false,
    paddingLeft: 10,
    keyboardType: Titanium.UI.KEYBOARD_EMAIL,
    returnKeyType: Titanium.UI.RETURNKEY_NEXT
  });
  emailText.addEventListener('return', function(e) {
    return passwordText.focus();
  });
  passwordText = Titanium.UI.createTextField({
    color: '#336699',
    hintText: 'Clave',
    paddingLeft: 10,
    clearOnEdit: true,
    passwordMask: true
  });
  passwordText.addEventListener('return', function(e) {
    var email, firstName, lastName, password, validate;
    email = emailText.value;
    password = passwordText.value;
    firstName = firstNameText.value;
    lastName = lastNameText.value;
    validate = root.validateNewAccountData(email, password, firstName, lastName);
    if (validate === true) {
      root.newAccountWindow.add(root.loadingView);
      return root.doRegister(email, password, firstName, lastName);
    } else {
      return alert('Revisa los datos: ' + validate);
    }
  });
  root.newAccountSection = Titanium.UI.createTableViewSection();
  root.newAccountData = [];
  firstNameRow = Titanium.UI.createTableViewRow();
  lastNameRow = Titanium.UI.createTableViewRow();
  emailRow = Titanium.UI.createTableViewRow();
  passwordRow = Titanium.UI.createTableViewRow();
  firstNameRow.add(firstNameText);
  lastNameRow.add(lastNameText);
  emailRow.add(emailText);
  passwordRow.add(passwordText);
  root.newAccountSection.add(firstNameRow);
  root.newAccountSection.add(lastNameRow);
  root.newAccountSection.add(emailRow);
  root.newAccountSection.add(passwordRow);
  acceptLegalLabel = Titanium.UI.createLabel({
    borderWidth: 0,
    top: 300,
    text: "Al clickar en Registrarse, aceptas los términos de uso y política de privacidad de ReallyLateBooking que puedes encontrar en la pestaña Opciones",
    color: '#fff',
    left: 8,
    font: {
      fontSize: 10
    }
  });
  newAccountButton = new root.GenericButton(250, 'Registrarse').button;
  newAccountButton.addEventListener('click', function(e) {
    var email, firstName, lastName, password, validate;
    email = emailText.value;
    password = passwordText.value;
    firstName = firstNameText.value;
    lastName = lastNameText.value;
    validate = root.validateNewAccountData(email, password, firstName, lastName);
    if (validate === true) {
      alert('entra en validate es true');
      root.newAccountWindow.add(root.loadingView);
      return root.doRegister(email, password, firstName, lastName);
    } else {
      return alert('Revisa los datos: ' + validate);
    }
  });
  root.newAccountView.add(acceptLegalLabel);
  root.newAccountView.add(newAccountButton);
}).call(this);

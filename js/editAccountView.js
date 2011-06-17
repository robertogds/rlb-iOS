(function() {
  var emailRow, firstNameRow, lastNameRow, passwordRow, sendButton;
  root.editAccountView = Titanium.UI.createView({
    backgroundImage: 'images/background1.png',
    width: 320
  });
  root.editAccountTable = Titanium.UI.createTableView({
    top: 0,
    height: 195,
    width: 300,
    borderWidth: 0,
    borderRadius: 10,
    scrollable: false,
    moving: false
  });
  root.firstNameText = Titanium.UI.createTextField({
    color: '#336699',
    hintText: 'Nombre',
    clearOnEdit: true,
    paddingLeft: 10,
    returnKeyType: Titanium.UI.RETURNKEY_NEXT
  });
  root.firstNameText.addEventListener('return', function(e) {
    return root.lastNameText.focus();
  });
  root.lastNameText = Titanium.UI.createTextField({
    color: '#336699',
    hintText: 'Apellidos',
    clearOnEdit: true,
    paddingLeft: 10,
    returnKeyType: Titanium.UI.RETURNKEY_NEXT
  });
  root.lastNameText.addEventListener('return', function(e) {
    return root.emailText.focus();
  });
  root.emailText = Titanium.UI.createTextField({
    color: '#336699',
    hintText: 'Email',
    clearOnEdit: true,
    paddingLeft: 10,
    keyboardType: Titanium.UI.KEYBOARD_EMAIL,
    returnKeyType: Titanium.UI.RETURNKEY_NEXT
  });
  root.emailText.addEventListener('return', function(e) {
    return root.passwordText.focus();
  });
  root.passwordText = Titanium.UI.createTextField({
    color: '#336699',
    hintText: 'Clave',
    paddingLeft: 10,
    clearOnEdit: true,
    passwordMask: true
  });
  root.passwordText.addEventListener('return', function(e) {
    return 1;
  });
  root.editAccountSection = Titanium.UI.createTableViewSection();
  root.editAccountSection.headerTitle = "Editar usuario";
  root.editAccountData = [];
  firstNameRow = Titanium.UI.createTableViewRow();
  lastNameRow = Titanium.UI.createTableViewRow();
  emailRow = Titanium.UI.createTableViewRow();
  passwordRow = Titanium.UI.createTableViewRow();
  firstNameRow.add(root.firstNameText);
  lastNameRow.add(root.lastNameText);
  emailRow.add(root.emailText);
  passwordRow.add(root.passwordText);
  root.editAccountSection.add(firstNameRow);
  root.editAccountSection.add(lastNameRow);
  root.editAccountSection.add(emailRow);
  root.editAccountSection.add(passwordRow);
  sendButton = new root.GenericButton(250, 'Enviar').button;
  sendButton.addEventListener('click', function(e) {
    var email, firstName, lastName, password;
    email = root.user.email;
    password = root.user.password;
    firstName = root.user.firstName;
    lastName = root.user.lastName;
    if (root.emailText.value !== '') {
      email = root.emailText.value;
    }
    if (root.passwordText.value !== '') {
      alert('Estoy cambiando el pass');
      password = root.passwordText.value;
    }
    if (root.firstNameText.value !== '') {
      firstName = root.firstNameText.value;
    }
    if (root.lastNameText.value !== '') {
      lastName = root.lastNameText.value;
    }
    return root.doRegister(email, password, firstName, lastName, root.user.id);
  });
  root.editAccountView.add(sendButton);
  root.editAccountWindow.add(root.editAccountView);
  root.loadEditLoggedUser = function() {
    root.firstNameText.hintText = 'Nombre: ' + root.user.firstName;
    root.lastNameText.hintText = 'Apellidos: ' + root.user.lastName;
    root.emailText.hintText = 'Email: ' + root.user.email;
    root.passwordText.hintText = 'Password: *******';
    root.editAccountData[0] = root.editAccountSection;
    root.editAccountTable.data = root.editAccountData;
    return root.editAccountView.add(root.editAccountTable);
  };
}).call(this);

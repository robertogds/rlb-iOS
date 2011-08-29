(function() {
  var emailRow, firstNameRow, lastNameRow, passwordRow, sendButton;
  root.editAccountView = Titanium.UI.createView({
    backgroundColor: 'transparent'
  });
  root.editAccountTable = Titanium.UI.createTableView({
    top: 20,
    height: 176,
    width: "95%",
    borderWidth: 0,
    borderRadius: 10,
    scrollable: false,
    moving: false,
    backgroundColor: '#fff'
  });
  root.firstNameText = Titanium.UI.createTextField({
    height: '100%',
    backgroundColor: '#fff',
    width: '100%',
    color: '#336699',
    hintText: Ti.Locale.getString('firstName'),
    clearOnEdit: true,
    paddingLeft: 10,
    returnKeyType: Titanium.UI.RETURNKEY_NEXT
  });
  root.firstNameText.addEventListener('return', function(e) {
    return root.lastNameText.focus();
  });
  root.lastNameText = Titanium.UI.createTextField({
    height: '100%',
    backgroundColor: '#fff',
    width: '100%',
    color: '#336699',
    hintText: Ti.Locale.getString('lastName'),
    clearOnEdit: true,
    paddingLeft: 10,
    returnKeyType: Titanium.UI.RETURNKEY_NEXT
  });
  root.lastNameText.addEventListener('return', function(e) {
    return root.emailText.focus();
  });
  root.emailText = Titanium.UI.createTextField({
    height: '100%',
    backgroundColor: '#fff',
    width: '100%',
    color: '#336699',
    hintText: Ti.Locale.getString('email'),
    clearOnEdit: true,
    paddingLeft: 10,
    keyboardType: Titanium.UI.KEYBOARD_EMAIL,
    returnKeyType: Titanium.UI.RETURNKEY_NEXT
  });
  root.emailText.addEventListener('return', function(e) {
    return root.passwordText.focus();
  });
  root.passwordText = Titanium.UI.createTextField({
    height: '100%',
    backgroundColor: '#fff',
    width: '100%',
    color: '#336699',
    hintText: Ti.Locale.getString('password'),
    paddingLeft: 10,
    clearOnEdit: true,
    passwordMask: true
  });
  root.passwordText.addEventListener('return', function(e) {
    return root.submitEdit();
  });
  root.editAccountSection = Titanium.UI.createTableViewSection();
  root.editAccountData = [];
  firstNameRow = Titanium.UI.createTableViewRow({
    width: '100%',
    height: 44
  });
  lastNameRow = Titanium.UI.createTableViewRow({
    width: '100%',
    height: 44
  });
  emailRow = Titanium.UI.createTableViewRow({
    width: '100%',
    height: 44
  });
  passwordRow = Titanium.UI.createTableViewRow({
    width: '100%',
    height: 44
  });
  firstNameRow.add(root.firstNameText);
  lastNameRow.add(root.lastNameText);
  emailRow.add(root.emailText);
  passwordRow.add(root.passwordText);
  root.editAccountSection.add(firstNameRow);
  root.editAccountSection.add(lastNameRow);
  root.editAccountSection.add(emailRow);
  root.editAccountSection.add(passwordRow);
  sendButton = new root.GenericButton(250, Ti.Locale.getString('send')).button;
  sendButton.addEventListener('click', function(e) {
    return root.submitEdit();
  });
  root.editAccountView.add(sendButton);
  root.editAccountWindow.add(root.editAccountView);
  root.loadEditLoggedUser = function() {
    root.firstNameText.hintText = Ti.Locale.getString('firstName') + ': ' + root.user.firstName;
    root.lastNameText.hintText = Ti.Locale.getString('lastName') + ': ' + root.user.lastName;
    root.emailText.hintText = Ti.Locale.getString('email') + ': ' + root.user.email;
    root.passwordText.hintText = Ti.Locale.getString('password') + ': *******';
    root.editAccountData[0] = root.editAccountSection;
    root.editAccountTable.data = root.editAccountData;
    return root.editAccountView.add(root.editAccountTable);
  };
  root.submitEdit = function() {
    var email, firstName, lastName, password, validate;
    email = root.user.email;
    password = root.user.password;
    firstName = root.user.firstName;
    lastName = root.user.lastName;
    if (root.emailText.value !== '') {
      email = root.emailText.value;
    }
    if (root.passwordText.value !== '') {
      password = root.passwordText.value;
    }
    if (root.firstNameText.value !== '') {
      firstName = root.firstNameText.value;
    }
    if (root.lastNameText.value !== '') {
      lastName = root.lastNameText.value;
    }
    validate = root.validateNewAccountData(email, password, firstName, lastName);
    if (validate === true) {
      root.showLoading(root.editAccountWindow);
      return root.doRegister(email, password, firstName, lastName, root.user.id);
    } else {
      return Ti.UI.createAlertDialog({
        title: 'ReallyLateBooking',
        message: L('reviewData') + ': ' + validate
      }).show();
    }
  };
}).call(this);

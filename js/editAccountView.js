(function() {
  var firstNameRow, lastNameRow, passwordRow, repeatPassRow, sendButton;

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
    width: '90%',
    height: '90%',
    backgroundColor: '#fff',
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
    width: '90%',
    height: '90%',
    backgroundColor: '#fff',
    color: '#336699',
    hintText: Ti.Locale.getString('lastName'),
    clearOnEdit: true,
    paddingLeft: 10,
    returnKeyType: Titanium.UI.RETURNKEY_NEXT
  });

  root.lastNameText.addEventListener('return', function(e) {
    return root.passwordText.focus();
  });

  root.passwordText = Titanium.UI.createTextField({
    width: '90%',
    height: '90%',
    backgroundColor: '#fff',
    color: '#336699',
    hintText: L('password'),
    paddingLeft: 10,
    clearOnEdit: true,
    passwordMask: true,
    returnKeyType: Titanium.UI.RETURNKEY_NEXT
  });

  root.passwordText.addEventListener('return', function(e) {
    return root.repeatPassText.focus();
  });

  root.repeatPassText = Titanium.UI.createTextField({
    width: '90%',
    height: '90%',
    backgroundColor: '#fff',
    color: '#336699',
    hintText: L('password'),
    paddingLeft: 10,
    clearOnEdit: true,
    passwordMask: true
  });

  root.repeatPassText.addEventListener('return', function(e) {
    return root.repeatPassText.blur();
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

  passwordRow = Titanium.UI.createTableViewRow({
    width: '100%',
    height: 44
  });

  repeatPassRow = Titanium.UI.createTableViewRow({
    width: '100%',
    height: 44
  });

  firstNameRow.add(root.firstNameText);

  lastNameRow.add(root.lastNameText);

  passwordRow.add(root.passwordText);

  repeatPassRow.add(root.repeatPassText);

  root.editAccountSection.add(firstNameRow);

  root.editAccountSection.add(lastNameRow);

  root.editAccountSection.add(passwordRow);

  root.editAccountSection.add(repeatPassRow);

  sendButton = new root.GenericButton(250, Ti.Locale.getString('send')).button;

  sendButton.addEventListener('click', function(e) {
    return root.submitEdit();
  });

  root.editAccountView.add(sendButton);

  root.editAccountWindow.add(root.editAccountView);

  root.loadEditLoggedUser = function() {
    root.hideLoading(root.editAccountWindow);
    root.firstNameText.hintText = L('firstName') + ': ' + root.user.firstName;
    root.lastNameText.hintText = L('lastName') + ': ' + root.user.lastName;
    root.passwordText.hintText = L('password') + ': *******';
    root.repeatPassText.hintText = L('repeatPass') + ': *******';
    root.editAccountData[0] = root.editAccountSection;
    root.editAccountTable.data = root.editAccountData;
    return root.editAccountView.add(root.editAccountTable);
  };

  root.submitEdit = function() {
    var email, firstName, lastName, password, repeatPass, validate;
    email = root.user.email;
    password = root.user.password;
    repeatPass = root.user.password;
    firstName = root.user.firstName;
    lastName = root.user.lastName;
    if (root.passwordText.value !== '') {
      password = Titanium.Utils.md5HexDigest(root.passwordText.value);
    }
    if (root.repeatPassText.value !== '') {
      repeatPass = Titanium.Utils.md5HexDigest(root.repeatPassText.value);
    }
    if (root.firstNameText.value !== '') firstName = root.firstNameText.value;
    if (root.lastNameText.value !== '') lastName = root.lastNameText.value;
    validate = root.validateNewAccountData(email, password, firstName, lastName, repeatPass);
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

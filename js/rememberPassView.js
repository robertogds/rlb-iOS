(function() {
  var data, rememberEmailText, rememberTable, rememberView, row, section, text, title;

  root.rememberPassView = Titanium.UI.createView({
    backgroundColor: 'transparent',
    width: 320
  });

  title = Ti.Locale.getString('youForgotPassword');

  text = Ti.Locale.getString('forgotPasswordIntroEmail');

  rememberView = new root.GenericTextView(0, title, text).view;

  rememberTable = Titanium.UI.createTableView({
    top: 120,
    height: 44,
    width: 300,
    borderWidth: 0,
    borderRadius: 10,
    scrollable: false,
    moving: false,
    backgroundColor: '#fff'
  });

  rememberEmailText = Titanium.UI.createTextField({
    backgroundColor: '#fff',
    width: '100%',
    color: '#336699',
    hintText: Ti.Locale.getString('email'),
    paddingLeft: 10,
    clearOnEdit: false,
    keyboardType: Titanium.UI.KEYBOARD_EMAIL,
    returnKeyType: Titanium.UI.RETURNKEY_NEXT
  });

  rememberEmailText.addEventListener('return', function(e) {
    var email;
    root.showLoading(root.rememberPassView);
    email = rememberEmailText.value;
    return root.doRememberPass(email);
  });

  section = Titanium.UI.createTableViewSection();

  data = [];

  row = Titanium.UI.createTableViewRow({
    width: '100%',
    height: 44
  });

  row.add(rememberEmailText);

  section.add(row);

  data[0] = section;

  rememberTable.data = data;

  root.rememberPassView.add(rememberView);

  root.rememberPassView.add(rememberTable);

  root.rememberPassWindow.add(root.rememberPassView);

}).call(this);

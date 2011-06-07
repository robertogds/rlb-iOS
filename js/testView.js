(function() {
  var bb1, data, passText, row1, row2, section, table, testButton, userText;
  root.testView = Titanium.UI.createView({
    background: 'transparent',
    borderWidth: 0,
    width: 320,
    top: 0
  });
  bb1 = Titanium.UI.createButtonBar({
    labels: ['One', 'Two', 'Three'],
    backgroundColor: '#000',
    top: 50,
    style: Titanium.UI.iPhone.SystemButtonStyle.BAR,
    height: 25,
    width: 200
  });
  root.testView.add(bb1);
  testButton = Titanium.UI.createButton({
    color: '#fff',
    title: 'Cuidades'
  });
  root.testView.add(root.loadingView);
  userText = Titanium.UI.createTextField({
    color: '#336699',
    hintText: 'Usuario',
    clearOnEdit: true,
    paddingLeft: 10
  });
  passText = Titanium.UI.createTextField({
    color: '#336699',
    hintText: 'Clave',
    paddingLeft: 10,
    clearOnEdit: true,
    passwordMask: true
  });
  table = Titanium.UI.createTableView({
    top: 200,
    height: 85,
    width: 300,
    borderWidth: 1,
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
  table.data = data;
  root.testView.add(table);
  testButton.addEventListener('click', function(e) {
    return root.showBookView(root.deal);
  });
}).call(this);

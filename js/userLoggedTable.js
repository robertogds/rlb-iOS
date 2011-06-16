(function() {
  var userEmailRow, userFirstNameRow, userLastNameRow;
  root.userLoggedTable = Titanium.UI.createTableView({
    top: 0,
    height: 150,
    width: 300,
    borderWidth: 0,
    borderRadius: 10,
    scrollable: false,
    moving: false
  });
  root.firstNameLabel = Titanium.UI.createLabel({
    color: '#afafaf',
    text: 'firstname',
    left: 11,
    font: {
      fontSize: 17,
      fontFamily: 'Helvetica Neue'
    }
  });
  root.lastNameLabel = Titanium.UI.createLabel({
    color: '#afafaf',
    left: 11,
    font: {
      fontSize: 17,
      fontFamily: 'Helvetica Neue'
    }
  });
  root.emailLabel = Titanium.UI.createLabel({
    color: '#afafaf',
    left: 11,
    font: {
      fontSize: 17,
      fontFamily: 'Helvetica Neue'
    }
  });
  root.userLoggedSection = Titanium.UI.createTableViewSection();
  root.userLoggedSection.headerTitle = "Estás logado como: ";
  root.userLoggedData = [];
  userFirstNameRow = Titanium.UI.createTableViewRow();
  userLastNameRow = Titanium.UI.createTableViewRow();
  userEmailRow = Titanium.UI.createTableViewRow();
  userFirstNameRow.add(root.firstNameLabel);
  userLastNameRow.add(root.lastNameLabel);
  userEmailRow.add(root.emailLabel);
  root.userLoggedSection.add(userFirstNameRow);
  root.userLoggedSection.add(userLastNameRow);
  root.userLoggedSection.add(userEmailRow);
  root.loadLoggedUser = function() {
    root.firstNameLabel.text = 'Nombre: ' + root.user.firstName;
    root.lastNameLabel.text = 'Apellidos: ' + root.user.lastName;
    root.emailLabel.text = 'Email: ' + root.user.email;
    root.userLoggedData[0] = root.userLoggedSection;
    root.userLoggedTable.data = root.userLoggedData;
    return root.loggedView.add(root.userLoggedTable);
  };
}).call(this);

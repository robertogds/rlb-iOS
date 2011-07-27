(function() {
  var userEmailRow, userFirstNameRow, userLastNameRow;
  root.userLoggedTable = Titanium.UI.createTableView({
    top: 5,
    height: 133,
    width: 300,
    borderWidth: 0,
    borderRadius: 10,
    scrollable: false,
    moving: false
  });
  root.firstNameLabel = Titanium.UI.createLabel({
    color: '#afafaf',
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
    root.firstNameLabel.text = Ti.Locale.getString('firstName') + ': ' + root.user.firstName;
    root.lastNameLabel.text = Ti.Locale.getString('lastName') + ': ' + root.user.lastName;
    root.emailLabel.text = Ti.Locale.getString('email') + ': ' + root.user.email;
    root.userLoggedData[0] = root.userLoggedSection;
    root.userLoggedTable.data = root.userLoggedData;
    root.loggedView.add(root.userLoggedTable);
    root.loggedView.add(root.editButton);
    return root.loggedView.add(root.logoutButton);
  };
  root.loadLoggedFacebookUser = function() {
    var facebookButton;
    Ti.API.info('Entra en loggedFacebook');
    root.firstNameLabel.text = Ti.Locale.getString('firstName') + ': ' + root.facebookUser.first_name;
    root.lastNameLabel.text = Ti.Locale.getString('lastName') + ': ' + root.facebookUser.last_name;
    root.emailLabel.text = Ti.Locale.getString('email') + ': ' + root.facebookUser.email;
    root.userLoggedData[0] = root.userLoggedSection;
    root.userLoggedTable.data = root.userLoggedData;
    root.loggedView.add(root.userLoggedTable);
    facebookButton = Titanium.Facebook.createLoginButton({
      top: 165,
      style: "wide"
    });
    return root.loggedView.add(facebookButton);
  };
}).call(this);

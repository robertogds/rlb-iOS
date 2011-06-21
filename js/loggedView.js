(function() {
  var customerView, editButton, logoutButton;
  Ti.include('/js/userLoggedTable.js', '/js/editAccountView.js');
  root.loggedView = Titanium.UI.createView({
    backgroundColor: "transparent",
    borderWidth: 0,
    width: 320,
    top: 1
  });
  customerView = new root.Generic2RowsView(200, 'Soporte a usuario', 'Danos tu opinión');
  editButton = new root.GenericButton(160, 'Editar Usuario').button;
  logoutButton = new root.GenericButton(310, 'Logout').button;
  logoutButton.addEventListener('click', function(e) {
    return root.doLogout();
  });
  editButton.addEventListener('click', function(e) {
    root.loadEditLoggedUser();
    return root.tabGroup.activeTab.open(root.editAccountWindow, {
      animated: true
    });
  });
  customerView.label1.addEventListener('click', function(e) {
    return root.tabGroup.activeTab.open(root.supportWindow, {
      animated: true
    });
  });
  customerView.label2.addEventListener('click', function(e) {
    var emailDialog;
    emailDialog = Titanium.UI.createEmailDialog();
    emailDialog.subject = "Feedback about ReallyLateBooking";
    emailDialog.toRecipients = ['info@reallylatebooking.com'];
    return emailDialog.open();
  });
  root.loggedView.add(editButton);
  root.loggedView.add(customerView.view);
  root.loggedView.add(logoutButton);
}).call(this);

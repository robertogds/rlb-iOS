(function() {
  var customerView;

  root.loggedView = Titanium.UI.createView({
    backgroundColor: "transparent",
    borderWidth: 0,
    top: 1
  });

  customerView = new root.Generic2RowsView(210, Ti.Locale.getString('userSupport'), Ti.Locale.getString('feedback'));

  root.editButton = new root.GenericButton(150, Ti.Locale.getString('editUser')).button;

  root.logoutButton = new root.GenericButton(310, Ti.Locale.getString('logout')).button;

  root.logoutButton.addEventListener('click', function(e) {
    return root.doLogout();
  });

  root.editButton.addEventListener('click', function(e) {
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
    emailDialog.subject = Ti.Locale.getString('feedbackEmailSubject');
    emailDialog.toRecipients = ['hola@reallylatebooking.com'];
    return emailDialog.open();
  });

  root.loggedView.add(customerView.view);

}).call(this);

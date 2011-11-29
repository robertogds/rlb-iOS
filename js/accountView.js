(function() {
  root.accountView = Titanium.UI.createView({
    backgroundColor: 'transparent'
  });
  root.accountView.add(root.loginView);
  root.accountView.add(root.loggedView);
  root.accountWindow.add(root.accountView);
}).call(this);

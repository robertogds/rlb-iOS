(function() {
  root.accountView = Titanium.UI.createView({
    backgroundColor: '#0d1e28'
  });
  root.accountView.add(root.loginView);
  root.accountView.add(root.loggedView);
  root.accountWindow.add(root.accountView);
}).call(this);

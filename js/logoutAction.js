(function() {
  root.doLogout = function() {
    root.user = null;
    Titanium.App.Properties.removeProperty("user");
    root.loginView.show();
    return root.loggedView.hide();
  };
}).call(this);

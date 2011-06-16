(function() {
  root.accountWindow.addEventListener('focus', function(e) {
    if (Titanium.App.Properties.hasProperty("user")) {
      root.loginView.hide();
      root.loggedView.show();
      root.loadLoggedUser();
    } else {
      root.loginView.show();
      root.loggedView.hide();
    }
    return 1;
  });
}).call(this);

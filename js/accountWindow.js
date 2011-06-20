(function() {
  root.accountWindow.addEventListener('focus', function(e) {
    if (Titanium.App.Properties.hasProperty("user")) {
      root.loginView.hide();
      root.loggedView.show();
      return root.loadLoggedUser();
    } else {
      root.loginView.show();
      return root.loggedView.hide();
    }
  });
}).call(this);

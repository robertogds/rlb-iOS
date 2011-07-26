(function() {
  root.accountWindow.addEventListener('focus', function(e) {
    alert('Entra en focus');
    if (Titanium.App.Properties.hasProperty("user")) {
      alert('Entra en esta logado por RLB');
      root.loginView.hide();
      root.loggedFacebookView.hide();
      root.loggedView.show();
      return root.loadLoggedUser();
    } else if (Titanium.Facebook.loggedIn) {
      alert('Entra en esta logado por facebook');
      root.loginView.hide();
      root.loggedView.hide();
      return root.loggedFacebookView.show();
    } else {
      alert('Entra en no esta logado');
      root.loginView.show();
      root.loggedView.hide();
      return root.loggedFacebookView.hide();
    }
  });
}).call(this);

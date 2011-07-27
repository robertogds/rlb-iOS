(function() {
  Ti.include('/js/userLoggedTable.js', '/js/loginView.js', '/js/loggedView.js', '/js/rememberPassAction.js', '/js/accountView.js');
  root.accountWindow.addEventListener('focus', function(e) {
    if (Titanium.App.Properties.hasProperty("user")) {
      Ti.API.info('Entra en esta logado por RLB');
      root.loginView.hide();
      root.loggedView.show();
      return root.loadLoggedUser();
    } else if (Titanium.Facebook.loggedIn) {
      Ti.API.info('Entra en esta logado por facebook');
      root.loginView.hide();
      root.loggedView.show();
      Ti.API.info('LLega a loadLogged');
      return root.loadLoggedFacebookUser();
    } else {
      root.loginView.show();
      return root.loggedView.hide();
    }
  });
}).call(this);

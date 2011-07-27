(function() {
  Ti.include('/js/newFacebookAccount.js');
  Titanium.Facebook.appid = "210123832352906";
  Titanium.Facebook.permissions = ['publish_stream', 'read_stream', 'email'];
  Titanium.Facebook.addEventListener('login', function(e) {
    if (e.success) {
      return Titanium.Facebook.requestWithGraphPath('me', {}, 'GET', function(e) {
        if (e.success) {
          root.facebookUser = JSON.parse(e.result);
          root.doFacebookRegister(root.facebookUser.email, root.facebookUser.first_name, root.facebookUser.last_name);
          root.loginView.hide();
          root.loadLoggedFacebookUser();
          return root.loggedView.show();
        } else if (e.error) {
          return alert(e.error);
        } else {
          return alert('Unknown response');
        }
      });
    } else {
      return alert('Error');
    }
  });
  Titanium.Facebook.addEventListener('logout', function(e) {
    root.facebookUser = null;
    Titanium.App.Properties.removeProperty("facebookUser");
    root.loginView.show();
    return root.loggedView.hide();
  });
  root.facebookButton = Titanium.Facebook.createLoginButton({
    top: 150,
    right: 30
  });
}).call(this);

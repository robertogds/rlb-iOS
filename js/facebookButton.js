(function() {
  Ti.include('/js/newFacebookAccount.js');
  Titanium.Facebook.appid = "210123832352906";
  Titanium.Facebook.permissions = ['publish_stream', 'read_stream', 'email'];
  Titanium.Facebook.addEventListener('login', function(e) {
    if (e.success) {
      Titanium.Facebook.requestWithGraphPath('me', {}, 'GET', function(e) {
        if (e.success) {
          root.facebookUser = JSON.parse(e.result);
          root.doFacebookRegister(root.facebookUser.email, root.facebookUser.first_name, root.facebookUser.last_name);
          root.loginView.remove(root.loadingView);
          root.loginView.hide();
          root.loadLoggedFacebookUser();
          return root.loggedView.show();
        } else {
          return alert(L('errorHappened'));
        }
      });
    } else {
      alert(L('errorHappened'));
    }
    return root.loginView.remove(root.loadingView);
  });
  Titanium.Facebook.addEventListener('logout', function(e) {
    root.facebookUser = null;
    Titanium.App.Properties.removeProperty("facebookUser");
    root.loginView.show();
    return root.loggedView.hide();
  });
  root.facebookLoginButton = Titanium.UI.createButton({
    backgroundImage: '/images/butt_facebook.png',
    color: '#fff',
    title: '    ' + L('loginFacebook'),
    width: 200,
    height: 32,
    font: {
      fontSize: 13,
      fontWeight: 'bold',
      fontFamily: 'Helvetica Neue'
    },
    top: 230
  });
  root.facebookLoginButton.addEventListener('click', function(e) {
    root.loginView.add(root.loadingView);
    return Titanium.Facebook.authorize();
  });
}).call(this);

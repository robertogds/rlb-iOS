(function() {
  var doFacebookLogin;

  Titanium.Facebook.appid = "210123832352906";

  Titanium.Facebook.permissions = ['publish_stream', 'read_stream', 'email'];

  doFacebookLogin = function() {
    return Titanium.Facebook.requestWithGraphPath('me', {}, 'GET', function(e) {
      Ti.API.info('Entra en login facebook');
      if (e.success) {
        root.facebookUser = JSON.parse(e.result);
        root.user = root.facebookUser;
        root.doFacebookRegister(root.facebookUser.email, root.facebookUser.first_name, root.facebookUser.last_name);
        root.loginLabelView.label1.text = L('signedInAs') + ' ' + root.facebookUser.email;
        return root.registerLabelView.label1.text = L('logout');
      } else {
        return Ti.UI.createAlertDialog({
          title: 'ReallyLateBooking',
          message: L('errorHappened')
        }).show();
      }
    });
  };

  Titanium.Facebook.addEventListener('login', function(e) {
    if (e.success) {
      return doFacebookLogin();
    } else {
      Ti.UI.createAlertDialog({
        title: 'ReallyLateBooking',
        message: L('errorHappened')
      }).show();
      root.hideLoading(root.signInWindow);
      return root.hideLoading(root.newAccountWindow);
    }
  });

  Titanium.Facebook.addEventListener('logout', function(e) {
    root.facebookUser = null;
    Titanium.App.Properties.removeProperty("facebookUser");
    root.loginLabelView.label1.text = L('loginLabel');
    return root.registerLabelView.label1.text = L('needAccount');
  });

  root.facebookLoginButton = Titanium.UI.createButton({
    backgroundImage: '/images/butt_facebook.jpg',
    color: '#fff',
    title: '    ' + L('loginFacebook'),
    width: 217,
    height: 34,
    font: {
      fontSize: 13,
      fontWeight: 'bold',
      fontFamily: 'Helvetica Neue'
    },
    top: 20
  });

  root.facebookLoginButton.addEventListener('click', function(e) {
    root.showLoading(root.signInWindow);
    return Titanium.Facebook.authorize();
  });

  root.facebookRegisterButton = Titanium.UI.createButton({
    backgroundImage: '/images/butt_facebook.jpg',
    color: '#fff',
    title: '    ' + L('registerFacebook'),
    width: 217,
    height: 34,
    font: {
      fontSize: 12,
      fontWeight: 'bold',
      fontFamily: 'Helvetica Neue'
    },
    top: 15
  });

  root.facebookRegisterButton.addEventListener('click', function(e) {
    root.showLoading(root.newAccountWindow);
    return Titanium.Facebook.authorize();
  });

}).call(this);

(function() {
  Titanium.Facebook.appid = "210123832352906";
  Titanium.Facebook.permissions = ['publish_stream', 'read_stream'];
  Titanium.Facebook.addEventListener('login', function(e) {
    if (e.success) {
      alert('Entra con facebook');
      root.loginView.hide();
      return root.loggedFacebookView.show();
    } else {
      return alert('Error');
    }
  });
  Titanium.Facebook.addEventListener('logout', function(e) {
    return alert('Logged out');
  });
  root.facebookButton = Titanium.Facebook.createLoginButton({
    top: 150,
    right: 30
  });
}).call(this);

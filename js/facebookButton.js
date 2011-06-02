(function() {
  Titanium.Facebook.appid = "210123832352906";
  Titanium.Facebook.permissions = ['publish_stream', 'read_stream'];
  Titanium.Facebook.addEventListener('click', function(e) {
    if (e.success) {
      return alert('Logged in');
    }
  });
  Titanium.Facebook.addEventListener('logout', function(e) {
    return alert('Logged out');
  });
  root.facebookButton = Titanium.Facebook.createLoginButton({
    top: 20,
    style: 'wide'
  });
}).call(this);

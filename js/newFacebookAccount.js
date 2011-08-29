(function() {
  root.xhrFacebookRegister = Titanium.Network.createHTTPClient();
  root.xhrFacebookRegister.onload = function(e) {
    var response;
    response = JSON.parse(this.responseText);
    if (response.status === 200) {
      root.user = response.content;
      root.facebookUser.rlbId = root.user.id;
      root.facebookUser.rlbToken = root.user.token;
      root.facebookUser.rlbSecret = root.user.secret;
      root.facebookUser.rlbPassword = root.user.password;
      Ti.API.info(response.content);
    } else {
      Ti.API.error(response.content);
      Ti.UI.createAlertDialog({
        title: 'ReallyLateBooking',
        message: L('errorHappened')
      }).show();
    }
    return Titanium.App.Properties.setString("facebookUser", JSON.stringify(root.facebookUser));
  };
  root.doFacebookRegister = function(email, firstName, lastName) {
    var newUser, password, proto, url;
    password = Titanium.Utils.md5HexDigest("facebookUser");
    url = root.url + "/users";
    proto = 'POST';
    root.xhrFacebookRegister.open(proto, url);
    root.xhrFacebookRegister.setRequestHeader("Content-Type", "application/json; charset=utf-8");
    root.xhrFacebookRegister.setRequestHeader("Accept-Language", Titanium.Locale.currentLanguage);
    newUser = JSON.stringify({
      "email": email,
      "password": password,
      "firstName": firstName,
      "lastName": lastName,
      "isFacebook": "true"
    });
    return root.xhrFacebookRegister.send(newUser);
  };
}).call(this);

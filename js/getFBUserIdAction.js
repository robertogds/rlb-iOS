(function() {
  root.xhrGetId = Titanium.Network.createHTTPClient();
  root.xhrGetId.onload = function(e) {
    var login;
    login = JSON.parse(this.responseText);
    if (login.status === 200) {
      root.user = login.content;
      root.facebookUser.rlbId = root.user.id;
      root.facebookUser.rlbToken = root.user.token;
      root.facebookUser.rlbSecret = root.user.secret;
      return Titanium.App.Properties.setString("facebookUser", JSON.stringify(root.facebookUser));
    } else {
      return alert('Error: ' + login.detail);
    }
  };
  root.xhrGetId.onerror = function(e) {
    alert('Unknown Error');
    return Ti.API.error(e);
  };
  root.getFBUserId = function() {
    var password;
    if (root.facebookUser.rlbId > 0) {
      root.user.id = root.facebookUser.rlbId;
      root.user.token = root.facebookUser.rlbToken;
      root.user.secret = root.facebookUser.rlbSecret;
      return true;
    } else {
      root.xhrGetId.setTimeout(5000);
      root.xhrGetId.open("POST", root.surl + "/users/login");
      root.xhrGetId.setRequestHeader("Content-Type", "application/json; charset=utf-8");
      root.xhrGetId.setRequestHeader("Accept-Language", Titanium.Locale.currentLanguage);
      password = Titanium.Utils.md5HexDigest("facebookUser");
      return root.xhrGetId.send(JSON.stringify({
        "email": root.facebookUser.email,
        "password": password
      }));
    }
  };
}).call(this);

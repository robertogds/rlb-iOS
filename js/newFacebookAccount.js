(function() {

  root.xhrFacebookRegister = Titanium.Network.createHTTPClient();

  root.xhrFacebookRegister.onload = function(e) {
    var response;
    Ti.API.info('Entra en FacebookRegistre onLoad ok');
    Ti.API.info(this.responseText);
    response = JSON.parse(this.responseText);
    Ti.API.info(response);
    if (response.status === 200) {
      Ti.API.info('Entra en status 200');
      root.user = response.content;
      root.facebookUser.rlbId = root.user.id;
      root.facebookUser.rlbToken = root.user.token;
      root.facebookUser.rlbSecret = root.user.secret;
      root.facebookUser.rlbPassword = root.user.password;
      Ti.API.info(response.content);
      root.hideLoading(root.newAccountWindow);
      root.hideLoading(root.signInWindow);
      root.newAccountWindow.close();
      root.signInWindow.close();
      if (root.tabGroup.activeTab.id === 'deals') root.showConfirmBooking();
    } else {
      Ti.API.error(response.content);
      Ti.UI.createAlertDialog({
        title: 'ReallyLateBooking',
        message: L('errorHappened')
      }).show();
    }
    Ti.API.info('*** Registra el usuario de facebook');
    return Titanium.App.Properties.setString("facebookUser", JSON.stringify(root.facebookUser));
  };

  root.xhrFacebookRegister.onerror = function(e) {
    Ti.API.info('Ha entrado en facebook register ERROR');
    root.showError(root.accountWindow);
    return Ti.API.error(e);
  };

  root.doFacebookRegister = function(email, firstName, lastName) {
    var newUser, password, proto, url;
    Ti.API.info('Entra en doFacebookRegister');
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
    Ti.API.info(newUser);
    return root.xhrFacebookRegister.send(newUser);
  };

}).call(this);

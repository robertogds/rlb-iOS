(function() {

  root.xhrRegister = Titanium.Network.createHTTPClient();

  root.xhrRegister.onload = function(e) {
    var response;
    root.hideLoading(root.newAccountWindow);
    response = JSON.parse(this.responseText);
    if (response.status === 200) {
      root.hideLoading(root.editAccountWindow);
      root.user = response.content;
      Titanium.App.Properties.setString("user", JSON.stringify(root.user));
      root.loadAccountLabels();
      root.newAccountWindow.close();
      root.editAccountWindow.close();
      if (root.tabGroup.activeTab.id === 'deals') return root.showConfirmBooking();
    } else {
      Ti.API.error(response.detail);
      return Ti.UI.createAlertDialog({
        title: 'ReallyLateBooking',
        message: 'Error: ' + response.detail
      }).show();
    }
  };

  root.xhrRegister.onerror = function(e) {
    Ti.API.info('Entra en error register');
    root.hideLoading(root.newAccountWindow);
    root.hideLoading(root.editAccountWindow);
    root.showError();
    return Ti.API.error(e);
  };

  root.doRegister = function(email, password, firstName, lastName, id) {
    var newUser, proto, signature, url;
    root.xhrRegister.setTimeout(8000);
    if (id > 0) {
      url = root.urlSignature("/user/" + id);
      signature = root.doSignature(url);
      url = root.surl + url + '/' + signature;
      proto = 'PUT';
    } else {
      password = Titanium.Utils.md5HexDigest(password);
      url = root.url + "/users";
      proto = 'POST';
    }
    root.xhrRegister.open(proto, url);
    root.xhrRegister.setRequestHeader("Content-Type", "application/json; charset=utf-8");
    root.xhrRegister.setRequestHeader("Accept-Language", Titanium.Locale.currentLanguage);
    newUser = JSON.stringify({
      "email": email,
      "password": password,
      "firstName": firstName,
      "lastName": lastName,
      "isFacebook": "false"
    });
    root.xhrRegister.send(newUser);
    return Ti.API.info('LLeta hasta el final');
  };

  root.validateNewAccountData = function(email, password, firstName, lastName, repeatPass) {
    if (password !== repeatPass) return Ti.Locale.getString('passDoNotMatch');
    if (!(email.length > 3)) return Ti.Locale.getString('errorEmail');
    if (!/\@/.test(email)) return Ti.Locale.getString('errorEmail');
    if (!(password.length > 3)) return Ti.Locale.getString('errorPassword');
    if (!(firstName.length > 0)) return Ti.Locale.getString('errorFirstName');
    if (!(lastName.length > 0)) return Ti.Locale.getString('errorLastName');
    return true;
  };

}).call(this);

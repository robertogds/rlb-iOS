(function() {
  root.xhrRegister = Titanium.Network.createHTTPClient();
  root.xhrRegister.onload = function(e) {
    var response;
    root.newAccountWindow.remove(root.loadingView);
    root.editAccountWindow.remove(root.loadingView);
    response = JSON.parse(this.responseText);
    if (response.status === 200) {
      root.user = response.content;
      Titanium.App.Properties.setString("user", JSON.stringify(root.user));
      root.loginView.hide();
      root.loggedView.show();
      root.newAccountWindow.close();
      return root.editAccountWindow.close();
    } else {
      Ti.API.error(response.detail);
      return alert('Error: ' + response.detail);
    }
  };
  root.xhrRegister.onerror = function(e) {
    root.newAccountWindow.remove(root.loadingView);
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
      "lastName": lastName
    });
    return root.xhrRegister.send(newUser);
  };
  root.validateNewAccountData = function(email, password, firstName, lastName) {
    if (!(email.length > 3)) {
      return Ti.Locale.getString('errorEmail');
    }
    if (!(password.length > 3)) {
      return Ti.Locale.getString('errorPassword');
    }
    if (!(firstName.length > 0)) {
      return Ti.Locale.getString('errorFirstName');
    }
    if (!(lastName.length > 0)) {
      return Ti.Locale.getString('errorLastName');
    }
    return true;
  };
}).call(this);

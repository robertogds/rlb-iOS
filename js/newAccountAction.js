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
      Ti.API.error('response.detail');
      return alert('Error: ' + response.detail);
    }
  };
  root.xhrRegister.onerror = function(e) {
    root.newAccountWindow.remove(root.loadingView);
    alert('sale por onerror' + e);
    return Ti.API.error(e);
  };
  root.doRegister = function(email, password, firstName, lastName, id) {
    var newUser, proto, url;
    root.xhrRegister.setTimeout(5000);
    if (id > 0) {
      url = root.url + "/user/" + id;
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
      return 'Email incorrecto';
    }
    if (!(password.length > 3)) {
      return 'Password incorrecto, debe tener al menos 4 caracteres';
    }
    if (!(firstName.length > 0)) {
      return 'Nombre vacío';
    }
    if (!(lastName.length > 0)) {
      return 'Apellidos vacío';
    }
    return true;
  };
}).call(this);

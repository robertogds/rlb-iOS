(function() {
  root.xhrRegister = Titanium.Network.createHTTPClient();
  root.xhrRegister.onload = function(e) {
    var response;
    root.newAccountWindow.remove(root.loadingView);
    response = JSON.parse(this.responseText);
    if (response.status === 201) {
      root.user = response.content;
      Titanium.App.Properties.setString("user", JSON.stringify(root.user));
      root.loginView.hide();
      root.loggedView.show();
      return root.newAccountWindow.close();
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
    root.newAccountWindow.add(root.loadingView);
    root.xhrRegister.setTimeout(5000);
    if (id > 0) {
      url = root.url + "/user/" + id;
      proto = 'PUT';
    } else {
      url = root.url + "/users";
      proto = 'POST';
    }
    root.xhrRegister.open(proto, url);
    root.xhrRegister.setRequestHeader("Content-Type", "application/json; charset=utf-8");
    newUser = JSON.stringify({
      "email": email,
      "password": Titanium.Utils.md5HexDigest(password),
      "firstName": firstName,
      "lastName": lastName
    });
    return root.xhrRegister.send(newUser);
  };
}).call(this);

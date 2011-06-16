(function() {
  root.xhrRegister = Titanium.Network.createHTTPClient();
  root.xhrRegister.onload = function(e) {
    var response;
    response = JSON.parse(this.responseText);
    if (response.status === 201) {
      root.user = response.content;
      Titanium.App.Properties.setString("user", JSON.stringify(root.user));
      root.loginView.hide();
      root.loggedView.show();
      root.loggedLabel.text = "Estas logado como " + root.user.email;
      root.loggedView.add(root.loggedLabel);
      return root.newAccountWindow.close();
    } else {
      return alert('Error: ' + response.detail);
    }
  };
  root.xhrRegister.onerror = function(e) {
    alert('sale por onerror' + e);
    return Ti.API.error(e);
  };
  root.doRegister = function(email, password, firstName, lastName, id) {
    var newUser, url;
    root.xhrRegister.setTimeout(5000);
    if (id === null) {
      url = "http://rlb-back.appspot.com/users";
    } else {
      url = "http://rlb-back.appspot.com/users/" + id;
    }
    alert(url);
    root.xhrRegister.open("POST", url);
    root.xhrRegister.setRequestHeader("Content-Type", "application/json; charset=utf-8");
    newUser = JSON.stringify({
      "email": email,
      "password": Titanium.Utils.md5HexDigest(password),
      "firstName": firstName,
      "lastName": lastName
    });
    root.xhrRegister.send(newUser);
    return 1;
  };
}).call(this);

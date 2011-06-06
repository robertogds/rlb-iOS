(function() {
  root.xhrRegister = Titanium.Network.createHTTPClient();
  root.xhrRegister.onload = function(e) {
    var newUser, response;
    response = JSON.parse(this.responseText);
    if (response.status === 201) {
      newUser = response.content;
      root.doLogin(newUser.email, newUser.password);
      return root.newAccountWindow.close();
    } else {
      return alert('Error: ' + response.detail);
    }
  };
  root.xhrRegister.onerror = function(e) {
    alert('sale por onerror' + e);
    return Ti.API.error(e);
  };
  root.doRegister = function(email, password, firstName, lastName) {
    var newUser;
    root.xhrRegister.setTimeout(5000);
    root.xhrRegister.open("POST", "http://rlb-back.appspot.com/users");
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

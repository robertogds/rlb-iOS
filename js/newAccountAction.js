(function() {
  root.xhrRegister = Titanium.Network.createHTTPClient();
  root.xhrRegister.onload = function(e) {
    return alert('sale por onload ' + this.responseText);
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
      "password": password,
      "firstName": firstName,
      "lastName": lastName
    });
    root.xhrRegister.send(newUser);
    return 1;
  };
}).call(this);

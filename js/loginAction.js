(function() {
  root.xhrLogin = Titanium.Network.createHTTPClient();
  root.xhrLogin.onload = function(e) {
    var login;
    login = JSON.parse(this.responseText);
    if (login.status === 200) {
      root.user = login.content;
      Titanium.App.Properties.setString("user", JSON.stringify(root.user));
      root.loginView.hide();
      return root.loggedView.show();
    } else {
      return alert('Error: ' + login.detail);
    }
  };
  root.xhrLogin.onerror = function(e) {
    alert('se ha producido un error');
    return Ti.API.error(e);
  };
  root.doLogin = function(email, password) {
    root.xhrLogin.setTimeout(5000);
    root.xhrLogin.open("POST", root.surl + "/users/login");
    root.xhrLogin.setRequestHeader("Content-Type", "application/json; charset=utf-8");
    root.xhrLogin.setRequestHeader("Accept-Language", Titanium.Locale.currentLanguage);
    return root.xhrLogin.send(JSON.stringify({
      "email": email,
      "password": password
    }));
  };
}).call(this);

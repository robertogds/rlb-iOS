(function() {
  root.xhrLogin = Titanium.Network.createHTTPClient();
  root.xhrLogin.onload = function(e) {
    var login, user;
    login = JSON.parse(this.responseText);
    if (login.status === 200) {
      user = login.content;
      alert(user);
      Titanium.App.Properties.setString("user", JSON.stringify(user));
      root.loginView.hide();
      root.loggedView.show();
      root.loggedLabel.text = "Estas logado como " + user.email;
      root.loggedView.add(root.loggedLabel);
      return 1;
    } else {
      return alert('Error ' + login.detail);
    }
  };
  root.xhrLogin.onerror = function(e) {
    alert('se ha producido un error');
    return Ti.API.error(e);
  };
  root.doLogin = function(email, password) {
    root.xhrLogin.setTimeout(5000);
    root.xhrLogin.open("POST", "https://rlb-back.appspot.com/users/login");
    root.xhrLogin.setRequestHeader("Content-Type", "application/json; charset=utf-8");
    root.xhrLogin.send(JSON.stringify({
      "email": email,
      "password": password
    }));
    return 1;
  };
}).call(this);

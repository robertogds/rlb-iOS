(function() {

  root.xhrLogin = Titanium.Network.createHTTPClient();

  root.xhrLogin.onload = function(e) {
    var login;
    try {
      login = JSON.parse(this.responseText);
    } catch (error) {
      Ti.UI.createAlertDialog({
        title: 'ReallyLateBooking',
        message: L('errorHappened') + '\n' + error
      }).show();
    }
    if (login.status === 200) {
      root.user = login.content;
      Titanium.App.Properties.setString("user", JSON.stringify(root.user));
      root.loginView.hide();
      root.loggedView.show();
      root.loadLoggedUser();
    } else {
      Ti.UI.createAlertDialog({
        title: 'ReallyLateBooking',
        message: 'Error: ' + login.detail
      }).show();
    }
    return root.hideLoading(root.accountWindow);
  };

  root.xhrLogin.onerror = function(e) {
    root.showError();
    return Ti.API.error(e);
  };

  root.doLogin = function(email, password) {
    Titanium.Analytics.featureEvent('login');
    root.xhrLogin.setTimeout(15000);
    root.xhrLogin.open("POST", root.surl + "/users/login");
    root.xhrLogin.setRequestHeader("Content-Type", "application/json; charset=utf-8");
    root.xhrLogin.setRequestHeader("Accept-Language", Titanium.Locale.currentLanguage);
    return root.xhrLogin.send(JSON.stringify({
      "email": email,
      "password": password
    }));
  };

  root.validateLoginData = function(email, password) {
    if (!(email.length > 3)) return Ti.Locale.getString('errorEmail');
    if (!(password.length > 3)) return Ti.Locale.getString('errorPassword');
    return true;
  };

}).call(this);

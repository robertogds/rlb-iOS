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
      root.loadAccountLabels();
      root.signInWindow.close();
      if (root.tabGroup.activeTab.id === 'deals') root.showConfirmBooking();
    } else {
      Ti.UI.createAlertDialog({
        title: 'ReallyLateBooking',
        message: 'Error: ' + login.detail
      }).show();
    }
    return root.hideLoading(root.signInView);
  };

  root.xhrLogin.onerror = function(e) {
    root.showError(root.accountWindow);
    return Ti.API.error(e);
  };

  root.doLogin = function(email, password) {
    Ti.API.info('*** Entra en doLogin');
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

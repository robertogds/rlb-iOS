(function() {

  root.xhrRemember = Titanium.Network.createHTTPClient();

  root.xhrRemember.onerror = function(e) {
    root.showError();
    return Ti.API.error(e);
  };

  root.xhrRemember.onload = function(e) {
    var response;
    response = JSON.parse(this.responseText);
    if (response.status === 200) {
      Ti.UI.createAlertDialog({
        title: 'ReallyLateBooking',
        message: 'Error: ' + response.detail
      }).show();
      return root.rememberPassWindow.close();
    } else {
      return alert('Error: ' + response.detail);
    }
  };

  root.doRememberPass = function(email) {
    root.xhrRemember.setTimeout(5000);
    root.xhrRemember.open("POST", root.url + "/users/remember");
    root.xhrRemember.setRequestHeader("Content-Type", "application/json; charset=utf-8");
    root.xhrRemember.setRequestHeader("Accept-Language", Titanium.Locale.currentLanguage);
    return root.xhrRemember.send(JSON.stringify({
      "email": email
    }));
  };

}).call(this);

(function() {
  root.xhrRemember = Titanium.Network.createHTTPClient();
  root.xhrRemember.onerror = function(e) {
    alert('Error: ' + e);
    return Ti.API.error(e);
  };
  root.xhrRemember.onload = function(e) {
    var response;
    response = JSON.parse(this.responseText);
    if (response.status === 200) {
      alert(response.detail);
      return root.rememberPassWindow.close();
    } else {
      return alert('Error: ' + response.detail);
    }
  };
  root.doRememberPass = function(email) {
    root.xhrRemember.setTimeout(5000);
    root.xhrRemember.open("POST", root.url + "/users/remember");
    root.xhrRemember.setRequestHeader("Content-Type", "application/json; charset=utf-8");
    return root.xhrRemember.send(JSON.stringify({
      "email": email
    }));
  };
}).call(this);

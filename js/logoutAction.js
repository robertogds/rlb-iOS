(function() {

  root.doLogout = function() {
    Ti.API.info('Entra root.doLogout');
    if (Titanium.Facebook.loggedIn) Ti.Facebook.logout;
    root.user = null;
    Titanium.App.Properties.removeProperty("user");
    Titanium.App.Properties.removeProperty("facebookUser");
    root.loadUser();
    Ti.API.info('llama a loadAccountLabels');
    return root.loadAccountLabels();
  };

}).call(this);

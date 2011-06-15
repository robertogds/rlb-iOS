(function() {
  Ti.include('/js/loginView.js', '/js/loggedView.js');
  root.accountView = Titanium.UI.createView({
    backgroundImage: 'images/background1.png',
    width: 320
  });
  root.accountView.add(root.loginView);
  root.accountView.add(root.loggedView);
  root.accountWindow.add(root.accountView);
}).call(this);

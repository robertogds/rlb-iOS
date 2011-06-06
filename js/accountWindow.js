(function() {
  root.accountWindow.addEventListener('focus', function(e) {
    if (root.userEmail !== null) {
      root.loginView.hide();
      root.loggedView.show();
      root.loggedLabel.text = "Estas logado como " + root.userEmail;
      root.loggedView.add(root.loggedLabel);
    } else {
      root.loginView.show();
      root.loggedView.hide();
    }
    return 1;
  });
}).call(this);

(function() {

  root.loadUser();

  Ti.include('/js/faqView.js', '/js/facebookButton.js', '/js/editAccountView.js', '/js/newAccountView.js', '/js/loginAction.js', '/js/logoutAction.js', '/js/newFacebookAccount.js', '/js/rememberPassView.js', '/js/signInView.js', '/js/rememberPassAction.js', '/js/accountView.js');

  root.accountWindow.addEventListener('focus', function(e) {
    Ti.API.info('Entra en focus accountWindow');
    return root.loadAccountLabels();
  });

  root.loadAccountLabels = function() {
    if (root.isLogged()) {
      root.loginLabelView.label1.text = L('signedInAs') + ' ' + root.user.email;
      return root.registerLabelView.label1.text = L('logout');
    } else {
      root.loginLabelView.label1.text = L('loginLabel');
      return root.registerLabelView.label1.text = L('needAccount');
    }
  };

}).call(this);

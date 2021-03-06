(function() {
  var contactView, supportTextView, supportView, text, title;

  supportView = Titanium.UI.createView({
    background: 'transparent',
    borderWidth: 0,
    top: 0
  });

  title = L('supportTitle');

  text = L('supportText');

  supportTextView = new root.GenericTextView(0, title, text).view;

  contactView = new root.Generic2RowsView(200, 'soporte@reallylatebooking.com', '+34 911 86 30 81');

  contactView.label1.addEventListener('click', function(e) {
    var emailDialog;
    emailDialog = Titanium.UI.createEmailDialog();
    emailDialog.subject = L('needHelp');
    emailDialog.toRecipients = ['soporte@reallylatebooking.com'];
    return emailDialog.open();
  });

  contactView.label2.addEventListener('click', function(e) {
    var phone;
    phone = '+34911863081';
    return Ti.Platform.openURL('tel:' + phone);
  });

  supportView.add(supportTextView);

  supportView.add(contactView.view);

  root.supportWindow.add(supportView);

}).call(this);

(function() {
  var contactView, forHotelsView, text, title;

  title = L('forHotelsTitle');

  text = L('forHotelsText');

  forHotelsView = new root.GenericTextView(0, title, text).view;

  contactView = new root.Generic2RowsView(200, 'hoteles@reallylatebooking.com', 'Llamar ');

  contactView.table.height = 44;

  contactView.label1.addEventListener('click', function(e) {
    var emailDialog;
    emailDialog = Titanium.UI.createEmailDialog();
    emailDialog.subject = L('forHotelsSubject');
    emailDialog.toRecipients = ['hoteles@reallylatebooking.com'];
    return emailDialog.open();
  });

  root.forHotelsWindow.add(forHotelsView);

  root.forHotelsWindow.add(contactView.view);

}).call(this);

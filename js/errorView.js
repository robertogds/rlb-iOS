(function() {
  var errorCloseButton, text, title;
  errorCloseButton = new root.GenericButton(290, L('tryAgain')).button;
  title = Ti.Locale.getString('errorHappened');
  text = Ti.Locale.getString('conectionError');
  root.errorView = new root.GenericTextView(0, title, text).view;
  root.errorView.height = '100%';
  root.errorView.add(errorCloseButton);
  errorCloseButton.addEventListener('click', function(e) {
    root.errorWindow.remove(root.errorView);
    root.tabGroup.setActiveTab(0);
    return root.showCities();
  });
}).call(this);

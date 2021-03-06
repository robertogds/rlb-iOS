(function() {
  var termsScrollView, title;

  termsScrollView = Titanium.UI.createScrollView({
    contentWidth: 'auto',
    contentHeight: 'auto',
    top: 0,
    showVerticalScrollIndicator: true
  });

  title = L('terms');

  root.termsView = new root.GenericTextView(0, title, '');

  termsScrollView.add(root.termsView.view);

  root.termsWindow.add(termsScrollView);

  root.xhrTerms = Titanium.Network.createHTTPClient();

  root.xhrTerms.onload = function() {
    var response, termsText;
    response = JSON.parse(this.responseText);
    termsText = response.content;
    root.hideLoading(root.termsWindow);
    return root.termsView.textLabel.text = termsText;
  };

  root.xhrTerms.onerror = function() {
    Ti.UI.createAlertDialog({
      title: 'ReallyLateBooking',
      message: L('errorHappened')
    }).show();
    root.hideLoading(root.termsWindow);
    return root.showError();
  };

  root.showTerms = function() {
    if (Titanium.Network.online === false) {
      Ti.UI.createAlertDialog({
        title: 'ReallyLateBooking',
        message: L('mustInternet')
      }).show();
      return root.showError();
    } else {
      root.tabGroup.activeTab.open(root.termsWindow, {
        animated: true
      });
      root.showLoading(root.termsWindow);
      root.xhrTerms.open('GET', root.termsUrl);
      root.xhrTerms.setRequestHeader("Accept-Language", Titanium.Locale.currentLanguage);
      return root.xhrTerms.send();
    }
  };

}).call(this);

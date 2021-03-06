(function() {
  var privacyScrollView, text, title;

  privacyScrollView = Titanium.UI.createScrollView({
    contentWidth: 'auto',
    contentHeight: 'auto',
    top: 0,
    showVerticalScrollIndicator: true
  });

  title = L('privacyPolicy');

  text = L('privacyText');

  root.privacyView = new root.GenericTextView(0, title, text);

  privacyScrollView.add(root.privacyView.view);

  root.privacyWindow.add(privacyScrollView);

  root.xhrPrivacy = Titanium.Network.createHTTPClient();

  root.xhrPrivacy.onload = function() {
    var privacyText, response;
    response = JSON.parse(this.responseText);
    privacyText = response.content;
    root.hideLoading(root.privacyWindow);
    return root.privacyView.textLabel.text = privacyText;
  };

  root.xhrPrivacy.onerror = function() {
    alert('Se produjo un error');
    root.hideLoading(root.privacyWindow);
    return root.showError();
  };

  root.showPrivacy = function() {
    if (Titanium.Network.online === false) {
      Ti.UI.createAlertDialog({
        title: 'ReallyLateBooking',
        message: L('mustInternet')
      }).show();
      return root.showError();
    } else {
      root.tabGroup.activeTab.open(root.privacyWindow, {
        animated: true
      });
      root.showLoading(root.privacyWindow);
      root.xhrPrivacy.open('GET', root.url + '/info/privacy');
      root.xhrPrivacy.setRequestHeader("Accept-Language", Titanium.Locale.currentLanguage);
      return root.xhrPrivacy.send();
    }
  };

}).call(this);

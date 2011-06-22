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
    root.termsWindow.remove(root.loadingView);
    return root.termsView.textLabel.text = termsText;
  };
  root.xhrTerms.onerror = function() {
    alert(L('errorHappened'));
    root.termsWindow.remove(root.loadingView);
    return root.showError();
  };
  root.showTerms = function() {
    if (Titanium.Network.online === false) {
      alert(L('mustInternet'));
      return root.showError();
    } else {
      root.tabGroup.activeTab.open(root.termsWindow, {
        animated: true
      });
      root.termsWindow.add(root.loadingView);
      root.xhrTerms.open('GET', root.url + '/info/use_terms');
      return root.xhrTerms.send();
    }
  };
}).call(this);

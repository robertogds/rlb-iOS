(function() {

  root.loadingView = Titanium.UI.createView({
    backgroundColor: '#000',
    borderWidth: 0,
    borderRadius: 10,
    opacity: 0.8,
    width: 140,
    height: 150,
    top: '30%'
  });

  root.loadLabel = Titanium.UI.createLabel({
    textAlign: 'center',
    height: 50,
    width: 120,
    borderWidth: 0,
    top: 12,
    text: Ti.Locale.getString('loading'),
    color: '#fff',
    font: {
      fontSize: 16,
      fontWeight: 'bold'
    }
  });

  root.iphoneActInd = Titanium.UI.createActivityIndicator({
    style: Titanium.UI.iPhone.ActivityIndicatorStyle.BIG,
    top: 70
  });

  root.androidActInd = Titanium.UI.createActivityIndicator({
    height: 50,
    width: 10,
    message: Ti.Locale.getString('loading')
  });

  root.loadingView.add(root.loadLabel);

  root.loadingView.add(root.iphoneActInd);

  root.iphoneActInd.show();

  root.showLoading = function(window, text) {
    if (text !== void 0) {
      root.loadLabel.text = text;
    } else {
      root.loadLabel.text = Ti.Locale.getString('loading');
    }
    if (Titanium.Platform.name === 'android') {
      return root.androidActInd.show();
    } else {
      return window.add(root.loadingView);
    }
  };

  root.hideLoading = function(window) {
    if (Titanium.Platform.name === 'android') {
      return root.androidActInd.hide();
    } else {
      return window.remove(root.loadingView);
    }
  };

}).call(this);

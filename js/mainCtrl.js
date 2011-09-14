(function() {
  var startupAnimation, startupView, startupWindow;
  root.url = 'http://rlb-back.appspot.com';
  root.surl = 'https://rlb-back.appspot.com';
  root.bgGradient = {
    type: 'linear',
    colors: [
      {
        color: '#07151d',
        position: 0.1
      }, {
        color: '#0d1e28',
        position: 1.0
      }
    ]
  };
  startupWindow = Ti.UI.createWindow({
    height: "100%",
    width: "100%",
    backgroundColor: '#000',
    navBarHidden: true,
    zIndex: 1
  });
  startupView = Titanium.UI.createImageView({
    image: 'images/Default.png',
    top: -20.0
  });
  startupAnimation = Titanium.UI.createAnimation({
    curve: Ti.UI.ANIMATION_CURVE_EASE_IN_OUT,
    opacity: 0,
    duration: 3000
  });
  startupWindow.add(startupView);
  startupWindow.open({
    navBarHidden: false
  });
  startupView.animate(startupAnimation);
  startupAnimation.addEventListener('complete', function(e) {
    root.tabGroup.open();
    return startupWindow.close();
  });
  Ti.include('/js/dateUtil.js', '/js/GenericWindow.js', '/js/GenericSeparatorView.js', '/js/Generic2RowsView.js', '/js/GenericRowView.js', '/js/GenericTextRow.js', '/js/GenericButton.js', '/js/GenericMapAnnotation.js', '/js/GenericTextView.js', '/js/GenericMapRightButtonView.js', '/js/GenericAndroidTab.js', '/js/errorView.js', '/js/loadingView.js', '/js/application.js', '/js/listDealsWindow.js', '/js/accountWindow.js', '/js/bookingsWindow.js', '/js/citiesWindow.js', '/js/oneDealView.js', '/js/oneBookingView.js', '/js/optionsView.js', '/js/bookingView.js', '/js/aboutView.js', '/js/forHotelsView.js', '/js/termsView.js', '/js/privacyView.js');
  Ti.API.info("Empieza");
  if (Titanium.App.Properties.hasProperty("user")) {
    root.user = JSON.parse(Titanium.App.Properties.getString("user"));
  } else if (Titanium.Facebook.loggedIn) {
    if (Titanium.App.Properties.hasProperty("facebookUser")) {
      root.facebookUser = JSON.parse(Titanium.App.Properties.getString("facebookUser"));
      root.user = root.facebookUser;
      root.user.id = root.facebookUser.rlbId;
      root.user.token = root.facebookUser.rlbToken;
      root.user.secret = root.facebookUser.rlbSecret;
      root.user.password = root.facebookUser.rlbPassword;
    } else {
      Titanium.Facebook.logout();
    }
  } else {
    Titanium.App.Properties.removeProperty("user");
    Titanium.App.Properties.removeProperty("facebookUser");
  }
  root.showCities();
  root.urlSignature = function(url) {
    var timestamp, token;
    timestamp = new Date().getTime();
    token = root.user.token;
    return url + '/' + token + '/' + timestamp;
  };
  root.doSignature = function(url) {
    var secret;
    secret = root.user.secret;
    return Titanium.Utils.md5HexDigest(url + secret);
  };
}).call(this);

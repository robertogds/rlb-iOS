(function() {
  root.url = 'http://rlb-back.appspot.com';
  root.surl = 'https://rlb-back.appspot.com';
  Ti.include('/js/GenericWindow.js', '/js/GenericSeparatorView.js', '/js/Generic2RowsView.js', '/js/GenericRowView.js', '/js/GenericTextRow.js', '/js/GenericButton.js', '/js/GenericMapAnnotation.js', '/js/GenericTextView.js', '/js/GenericMapRightButtonView.js', '/js/loadingView.js', '/js/errorView.js', '/js/application.js', '/js/listDealsWindow.js', '/js/accountWindow.js', '/js/bookingsWindow.js', '/js/oneDealView.js', '/js/oneBookingView.js', '/js/accountView.js', '/js/testView.js', '/js/optionsView.js', '/js/bookingView.js', '/js/citiesTable.js', '/js/aboutView.js', '/js/forHotelsView.js', '/js/termsView.js', '/js/privacyView.js');
  if (Titanium.App.Properties.hasProperty("user")) {
    root.user = JSON.parse(Titanium.App.Properties.getString("user"));
    Ti.API.info(root.user);
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

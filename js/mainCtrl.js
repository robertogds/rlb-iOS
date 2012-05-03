(function() {
  var _ref;

  root.url = 'http://rlb-back.appspot.com';

  root.surl = 'https://rlb-back.appspot.com';

  root.faqUrl = root.url + '/info/faq';

  root.termsUrl = root.url + '/info/use_terms';

  root.country = 'spain';

  root.countriesDate = new Date();

  root.cell = {};

  root.osname = Ti.Platform.osname;

  root.isAndroid = (_ref = root.osname === 'android') != null ? _ref : {
    "true": false
  };

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

  Ti.include('/js/mocks.js', '/js/staticCities.js', '/js/staticOtherCities.js', '/js/staticZones.js', '/js/gpsData.js', '/js/fetchDeals.js', '/js/dateUtil.js', '/js/GenericWindow.js', '/js/GenericSeparatorView.js', '/js/Generic2RowsView.js', '/js/GenericRowView.js', '/js/GenericNightView.js', '/js/GenericTextRow.js', '/js/GenericButton.js', '/js/GenericMapAnnotation.js', '/js/GenericTextView.js', '/js/GenericMapRightButtonView.js', '/js/GenericAndroidTab.js', '/js/errorView.js', '/js/loadingView.js', '/js/application.js', '/js/listDealsWindow.js', '/js/loadUser.js', '/js/accountWindow.js', '/js/bookingsWindow.js', '/js/citiesWindow.js', '/js/showDeal.js', '/js/oneBookingView.js', '/js/optionsView.js', '/js/bookingView.js', '/js/aboutView.js', '/js/forHotelsView.js', '/js/termsView.js', '/js/privacyView.js');

  root.initializeGPS();

}).call(this);

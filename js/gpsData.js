(function() {
  var locationAdded, translateErrorCode;
  Ti.Geolocation.preferredProvider = "gps";
  Ti.Geolocation.purpose = "Get Current Location";
  locationAdded = false;
  root.gpsCountry = void 0;
  root.gpsCity = void 0;
  translateErrorCode = function(code) {
    if (code === null) {
      return null;
    }
    switch (code) {
      case Ti.Geolocation.ERROR_LOCATION_UNKNOWN:
        return "Location unknown";
      case Ti.Geolocation.ERROR_DENIED:
        return "Access denied";
      case Ti.Geolocation.ERROR_NETWORK:
        return "Network error";
      case Ti.Geolocation.ERROR_HEADING_FAILURE:
        return "Failure to detect heading";
      case Ti.Geolocation.ERROR_REGION_MONITORING_DENIED:
        return "Region monitoring access denied";
      case Ti.Geolocation.ERROR_REGION_MONITORING_FAILURE:
        return "Region monitoring access failure";
      case Ti.Geolocation.ERROR_REGION_MONITORING_DELAYED:
        return "Region monitoring setup delayed";
    }
  };
  root.initializeGPS = function() {
    var authorization;
    root.isGPS = true;
    if (Titanium.Geolocation.locationServicesEnabled === false) {
      Titanium.UI.createAlertDialog({
        title: 'ReallyLateBooking',
        message: 'Your device has geo turned off - turn it on.'
      }).show();
      return root.fetchCountries();
    }
    authorization = Titanium.Geolocation.locationServicesAuthorization;
    if (authorization === Titanium.Geolocation.AUTHORIZATION_DENIED) {
      Ti.UI.createAlertDialog({
        title: 'ReallyLateBooking',
        message: 'You have disallowed from running geolocation services.'
      }).show();
      return root.fetchCountries();
    } else if (authorization === Titanium.Geolocation.AUTHORIZATION_RESTRICTED) {
      Ti.UI.createAlertDialog({
        title: 'ReallyLateBooking',
        message: 'Your system has disallowed from running geolocation services.'
      }).show();
      return root.fetchCountries();
    }
    return root.getGPSData();
  };
  root.getGPSData = function() {
    root.showLoading(root.countriesWindow, 'Getting GPS Location');
    Titanium.Geolocation.accuracy = Titanium.Geolocation.ACCURACY_BEST;
    Titanium.Geolocation.distanceFilter = 10;
    return Titanium.Geolocation.getCurrentPosition(function(e) {
      var accuracy, altitude, altitudeAccuracy, heading, latitude, longitude, speed, timestamp;
      Ti.API.info("Entra en getCurrentPosition ");
      if (!e.success || e.error) {
        Ti.API.info("Code translation: " + translateErrorCode(e.code));
        alert('error ' + JSON.stringify(e.error));
        return;
      }
      longitude = e.coords.longitude;
      latitude = e.coords.latitude;
      altitude = e.coords.altitude;
      heading = e.coords.heading;
      accuracy = e.coords.accuracy;
      speed = e.coords.speed;
      timestamp = e.coords.timestamp;
      altitudeAccuracy = e.coords.altitudeAccuracy;
      Ti.API.info('speed ' + speed);
      Ti.API.info('long:' + longitude + ' lat: ' + latitude);
      Titanium.API.info('geo - current location: ' + new Date(timestamp) + ' long ' + longitude + ' lat ' + latitude + ' accuracy ' + accuracy);
      Titanium.Geolocation.reverseGeocoder(latitude, longitude, function(evt) {
        var city, citypre, gpsCountry, places;
        Ti.API.info("Entra en reverseGeocoder: " + evt.places[0].city + " " + evt.places[0].country);
        if (evt.success) {
          places = evt.places;
          if (places && places.length) {
            gpsCountry = places[0].country;
            citypre = JSON.stringify({
              "name": places[0].city,
              "url": "madrid"
            });
            city = JSON.parse(citypre);
            root.fetchDeals(city);
            root.gpsFetchCities = function() {};
            return root.gpsFetchDeals = function() {};
          } else {
            Ti.API.error("No address found");
            Ti.API.debug("reverse geolocation result = " + JSON.stringify(evt));
            return root.fetchCountries();
          }
        } else {
          Ti.UI.createAlertDialog({
            title: 'ReallyLateBooking',
            message: evt.error
          }).show();
          errorDialog.show();
          Ti.API.info("Code translation: " + translateErrorCode(e.code));
          return Titanium.API.info('geo - location updated: ' + new Date(timestamp) + ' long ' + longitude + ' lat ' + latitude + ' accuracy ' + accuracy);
        }
      });
      locationAdded = true;
      return root.hideLoading(root.countriesWindow);
    });
  };
}).call(this);

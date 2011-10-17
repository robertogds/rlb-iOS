(function() {
  var authorization, headingAdded, headingCallback, locationCallback, translateErrorCode;
  Ti.Geolocation.preferredProvider = "gps";
  Ti.Geolocation.purpose = "Get Current Location";
  if (Titanium.Geolocation.locationServicesEnabled === false) {
    Titanium.UI.createAlertDialog({
      title: 'ReallyLateBooking',
      message: 'Your device has geo turned off - turn it on.'
    }).show();
  } else {
    if (Titanium.Platform.name !== 'android') {
      authorization = Titanium.Geolocation.locationServicesAuthorization;
      Ti.API.info('Authorization: ' + authorization);
      if (authorization === Titanium.Geolocation.AUTHORIZATION_DENIED) {
        Ti.UI.createAlertDialog({
          title: 'Kitchen Sink',
          message: 'You have disallowed Titanium from running geolocation services.'
        }).show();
      } else if (authorization === Titanium.Geolocation.AUTHORIZATION_RESTRICTED) {
        Ti.UI.createAlertDialog({
          title: 'Kitchen Sink',
          message: 'Your system has disallowed Titanium from running geolocation services.'
        }).show();
      }
    }
    if (Titanium.Geolocation.hasCompass) {
      Titanium.Geolocation.showCalibration = false;
      Titanium.Geolocation.headingFilter = 90;
      Ti.Geolocation.getCurrentHeading = function(e) {
        var accuracy, magneticHeading, timestamp, trueHeading, x, y, z;
        if (e.error) {
          currentHeading.text = 'error: ' + e.error;
          Ti.API.info("Code translation: " + translateErrorCode(e.code));
          return;
        }
        x = e.heading.x;
        y = e.heading.y;
        z = e.heading.z;
        magneticHeading = e.heading.magneticHeading;
        accuracy = e.heading.accuracy;
        trueHeading = e.heading.trueHeading;
        timestamp = e.heading.timestamp;
        currentHeading.text = 'x:' + x + ' y: ' + y + ' z:' + z;
        return Titanium.API.info('geo - current heading: ' + new Date(timestamp) + ' x ' + x + ' y ' + y + ' z ' + z);
      };
      headingCallback = function(e) {
        var accuracy, magneticHeading, timestamp, trueHeading, x, y, z;
        if (e.error) {
          updatedHeading.text = 'error: ' + e.error;
          Ti.API.info("Code translation: " + translateErrorCode(e.code));
          return;
        }
        x = e.heading.x;
        y = e.heading.y;
        z = e.heading.z;
        magneticHeading = e.heading.magneticHeading;
        accuracy = e.heading.accuracy;
        trueHeading = e.heading.trueHeading;
        timestamp = e.heading.timestamp;
        return Titanium.API.info('geo - heading updated: ' + new Date(timestamp) + ' x ' + x + ' y ' + y + ' z ' + z);
      };
      Titanium.Geolocation.addEventListener('heading', headingCallback);
      headingAdded = true;
    } else {
      Titanium.API.info("No Compass on device");
      currentHeading.text = 'No compass available';
      updatedHeading.text = 'No compass available';
    }
    Titanium.Geolocation.accuracy = Titanium.Geolocation.ACCURACY_BEST;
    Titanium.Geolocation.distanceFilter = 10;
    Titanium.Geolocation.getCurrentPosition(function(e) {
      var accuracy, altitude, altitudeAccuracy, heading, latitude, longitude, speed, timestamp;
      if (!e.success || e.error) {
        currentLocation.text = 'error: ' + JSON.stringify(e.error);
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
      currentLocation.text = 'long:' + longitude + ' lat: ' + latitude;
      return Titanium.API.info('geo - current location: ' + new Date(timestamp) + ' long ' + longitude + ' lat ' + latitude + ' accuracy ' + accuracy);
    });
    locationCallback = function(e) {
      var accuracy, altitude, altitudeAccuracy, heading, latitude, longitude, speed, timestamp;
      if (!e.success || e.error) {
        currentLocation.text = 'error: ' + JSON.stringify(e.error);
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
      return alert('long:' + longitude + ' lat: ' + latitude);
    };
    Titanium.Geolocation.reverseGeocoder(latitude, longitude, function(evt) {
      var errorDialog, places;
      if (evt.success) {
        places = evt.places;
        if (places && places.length) {
          return reverseGeo.text = places[0].address;
        } else {
          reverseGeo.text = "No address found";
          return Ti.API.debug("reverse geolocation result = " + JSON.stringify(evt));
        }
      } else {
        errorDialog = Ti.UI.createAlertDialog({
          title: 'Reverse geo error',
          message: evt.error
        });
        errorDialog.show();
        return Ti.API.info("Code translation: " + translateErrorCode(e.code));
      }
    });
  }
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
}).call(this);

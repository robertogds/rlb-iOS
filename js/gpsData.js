(function() {
  var getNearCity, locationAdded, translateErrorCode;

  Ti.Geolocation.preferredProvider = "gps";

  Ti.Geolocation.purpose = "Get Current Location";

  locationAdded = false;

  root.gpsCountry = void 0;

  root.gpsCity = void 0;

  Number.prototype.toDeg = function() {
    return this * 180 / Math.PI;
  };

  Number.prototype.toRad = function() {
    return this * Math.PI / 180;
  };

  getNearCity = function(lat, lon) {
    var R, a, allCities, c, city, cityLatRad, dLat, dLon, distance, latRad, lowDistance, nearCity, _i, _len;
    R = 6371;
    lowDistance = 1000;
    nearCity = void 0;
    allCities = root.staticCities.concat(root.staticOtherCities);
    for (_i = 0, _len = allCities.length; _i < _len; _i++) {
      city = allCities[_i];
      cityLatRad = city.latitude * Math.PI / 180;
      latRad = lat * Math.PI / 180;
      dLat = (city.latitude - lat) * Math.PI / 180;
      dLon = (city.longitude - lon) * Math.PI / 180;
      a = Math.sin(dLat / 2) * Math.sin(dLat / 2) + Math.cos(latRad) * Math.cos(cityLatRad) * Math.sin(dLon / 2) * Math.sin(dLon / 2);
      c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
      distance = R * c;
      if (distance < lowDistance) {
        nearCity = city;
        lowDistance = distance;
      }
    }
    if (lowDistance < 100 && nearCity !== void 0) {
      Ti.API.info('+++ GPS Encontrada NEARCITY = ' + nearCity.name);
      return root.loadDeals(nearCity);
    } else {
      return Ti.UI.createAlertDialog({
        title: 'ReallyLateBooking',
        message: L('noDealsGPS')
      }).show();
    }
  };

  translateErrorCode = function(code) {
    if (code === null) return null;
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
    root.showLoading(root.citiesWindow, 'Getting GPS Location');
    root.isGPS = true;
    if (Titanium.Geolocation.locationServicesEnabled === false) {
      Ti.API.info('Entra en geo off');
      Titanium.UI.createAlertDialog({
        title: 'ReallyLateBooking',
        message: L('geoOff')
      }).show();
      return root.hideLoading(root.citiesWindow);
    }
    authorization = Titanium.Geolocation.locationServicesAuthorization;
    if (authorization === Titanium.Geolocation.AUTHORIZATION_DENIED) {
      Ti.UI.createAlertDialog({
        title: 'ReallyLateBooking',
        message: L('youGeoDisallow')
      }).show();
      return root.hideLoading(root.citiesWindow);
    } else if (authorization === Titanium.Geolocation.AUTHORIZATION_RESTRICTED) {
      Ti.UI.createAlertDialog({
        title: 'ReallyLateBooking',
        message: L('systemGeoDisallow')
      }).show();
      return root.hideLoading(root.citiesWindow);
    }
    return root.getGPSData();
  };

  root.getGPSData = function() {
    Titanium.Geolocation.accuracy = Titanium.Geolocation.ACCURACY_HIGH;
    Titanium.Geolocation.distanceFilter = 10;
    return Titanium.Geolocation.getCurrentPosition(function(e) {
      var accuracy, altitude, altitudeAccuracy, heading, latitude, longitude, speed, timestamp;
      Ti.API.info("Entra en getCurrentPosition ");
      if (!e.success || e.error) {
        Ti.API.info("Code translation: " + translateErrorCode(e.code));
        Ti.UI.createAlertDialog({
          title: 'ReallyLateBooking',
          message: L('geoOff')
        }).show();
        root.hideLoading(root.citiesWindow);
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
      getNearCity(latitude, longitude);
      Titanium.API.info('geo - current location: ' + new Date(timestamp) + ' long ' + longitude + ' lat ' + latitude + ' accuracy ' + accuracy);
      return locationAdded = true;
    });
  };

}).call(this);

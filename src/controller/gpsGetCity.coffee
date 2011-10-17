Ti.Geolocation.preferredProvider = "gps"
Ti.Geolocation.purpose = "Get Current Location"

if Titanium.Geolocation.locationServicesEnabled is false
  Titanium.UI.createAlertDialog({title:'ReallyLateBooking',message:'Your device has geo turned off - turn it on.'}).show()
else
  if Titanium.Platform.name isnt 'android'
    authorization = Titanium.Geolocation.locationServicesAuthorization
    Ti.API.info('Authorization: '+authorization)
    if authorization is Titanium.Geolocation.AUTHORIZATION_DENIED
      Ti.UI.createAlertDialog({title:'Kitchen Sink',message:'You have disallowed Titanium from running geolocation services.'}).show()
    else if authorization is Titanium.Geolocation.AUTHORIZATION_RESTRICTED
      Ti.UI.createAlertDialog({title:'Kitchen Sink',message:'Your system has disallowed Titanium from running geolocation services.'}).show()

  if Titanium.Geolocation.hasCompass
    Titanium.Geolocation.showCalibration = false
    Titanium.Geolocation.headingFilter = 90
    Ti.Geolocation.getCurrentHeading = (e) ->
      if e.error
        currentHeading.text = 'error: ' + e.error
        Ti.API.info("Code translation: "+translateErrorCode(e.code))
        return
      x = e.heading.x
      y = e.heading.y
      z = e.heading.z;
      magneticHeading = e.heading.magneticHeading;
      accuracy = e.heading.accuracy;
      trueHeading = e.heading.trueHeading;
      timestamp = e.heading.timestamp;
      currentHeading.text = 'x:' + x + ' y: ' + y + ' z:' + z;
      Titanium.API.info('geo - current heading: ' + new Date(timestamp) + ' x ' + x + ' y ' + y + ' z ' + z)

    headingCallback = (e) ->
      if e.error
        updatedHeading.text = 'error: ' + e.error
        Ti.API.info("Code translation: "+translateErrorCode(e.code))
        return
      x = e.heading.x
      y = e.heading.y
      z = e.heading.z
      magneticHeading = e.heading.magneticHeading
      accuracy = e.heading.accuracy
      trueHeading = e.heading.trueHeading
      timestamp = e.heading.timestamp
      Titanium.API.info('geo - heading updated: ' + new Date(timestamp) + ' x ' + x + ' y ' + y + ' z ' + z)
			
    Titanium.Geolocation.addEventListener('heading', headingCallback)
    headingAdded = true
  else
    Titanium.API.info("No Compass on device")
    currentHeading.text = 'No compass available'
    updatedHeading.text = 'No compass available'

  Titanium.Geolocation.accuracy = Titanium.Geolocation.ACCURACY_BEST
  Titanium.Geolocation.distanceFilter = 10

  Titanium.Geolocation.getCurrentPosition (e) ->
    if (!e.success || e.error)
      currentLocation.text = 'error: ' + JSON.stringify(e.error)
      Ti.API.info("Code translation: "+translateErrorCode(e.code))
      alert('error ' + JSON.stringify(e.error))
      return
  
    longitude = e.coords.longitude
    latitude = e.coords.latitude
    altitude = e.coords.altitude
    heading = e.coords.heading
    accuracy = e.coords.accuracy
    speed = e.coords.speed
    timestamp = e.coords.timestamp
    altitudeAccuracy = e.coords.altitudeAccuracy
    Ti.API.info('speed ' + speed)
    currentLocation.text = 'long:' + longitude + ' lat: ' + latitude
    Titanium.API.info('geo - current location: ' + new Date(timestamp) + ' long ' + longitude + ' lat ' + latitude + ' accuracy ' + accuracy)

  locationCallback = (e) ->
    if (!e.success || e.error)
      currentLocation.text = 'error: ' + JSON.stringify(e.error)
      Ti.API.info("Code translation: "+translateErrorCode(e.code))
      alert('error ' + JSON.stringify(e.error))
      return

    longitude = e.coords.longitude
    latitude = e.coords.latitude
    altitude = e.coords.altitude
    heading = e.coords.heading
    accuracy = e.coords.accuracy
    speed = e.coords.speed
    timestamp = e.coords.timestamp
    altitudeAccuracy = e.coords.altitudeAccuracy
    alert 'long:' + longitude + ' lat: ' + latitude

  Titanium.Geolocation.reverseGeocoder latitude,longitude,(evt) ->
    if (evt.success)
      places = evt.places
      if (places && places.length) 
        reverseGeo.text = places[0].address
      else 
        reverseGeo.text = "No address found"
        Ti.API.debug("reverse geolocation result = "+JSON.stringify(evt));
    else 
      errorDialog = Ti.UI.createAlertDialog
        title:'Reverse geo error'
        message:evt.error
      errorDialog.show()
      Ti.API.info("Code translation: "+translateErrorCode(e.code))



translateErrorCode = (code) -> 
  if (code == null)
    return null
  switch code
    when Ti.Geolocation.ERROR_LOCATION_UNKNOWN then return "Location unknown"
    when Ti.Geolocation.ERROR_DENIED then return "Access denied"
    when Ti.Geolocation.ERROR_NETWORK then return "Network error"
    when Ti.Geolocation.ERROR_HEADING_FAILURE then return "Failure to detect heading"
    when Ti.Geolocation.ERROR_REGION_MONITORING_DENIED then return "Region monitoring access denied"
    when Ti.Geolocation.ERROR_REGION_MONITORING_FAILURE then return "Region monitoring access failure"
    when Ti.Geolocation.ERROR_REGION_MONITORING_DELAYED then return "Region monitoring setup delayed"
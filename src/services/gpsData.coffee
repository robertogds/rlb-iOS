Ti.Geolocation.preferredProvider = "gps"
Ti.Geolocation.purpose = "Get Current Location"
locationAdded = false
root.gpsCountry = undefined
root.gpsCity = undefined


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

root.initializeGPS = () ->
	root.isGPS = true
	if Titanium.Geolocation.locationServicesEnabled is false
		Titanium.UI.createAlertDialog({title:'ReallyLateBooking',message:'Your device has geo turned off - turn it on.'}).show()
		return root.fetchCountries()
	authorization = Titanium.Geolocation.locationServicesAuthorization
	if authorization is Titanium.Geolocation.AUTHORIZATION_DENIED
		Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:'You have disallowed from running geolocation services.'}).show()
		return root.fetchCountries()
	else if authorization is Titanium.Geolocation.AUTHORIZATION_RESTRICTED
		Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:'Your system has disallowed from running geolocation services.'}).show()
		return root.fetchCountries()
	root.getGPSData()	


root.getGPSData = () ->
	root.showLoading(root.countriesWindow,'Getting GPS Location')
	Titanium.Geolocation.accuracy = Titanium.Geolocation.ACCURACY_BEST
	Titanium.Geolocation.distanceFilter = 10
	Titanium.Geolocation.getCurrentPosition (e) ->
		Ti.API.info "Entra en getCurrentPosition " 
		if  (!e.success || e.error)
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
		Ti.API.info('long:' + longitude + ' lat: ' + latitude)
		Titanium.API.info('geo - current location: ' + new Date(timestamp) + ' long ' + longitude + ' lat ' + latitude + ' accuracy ' + accuracy)
		Titanium.Geolocation.reverseGeocoder latitude,longitude,(evt) ->
			Ti.API.info("Entra en reverseGeocoder: " + evt.places[0].city + " " + evt.places[0].country)
			if (evt.success)
				places = evt.places
				if (places && places.length) 
					gpsCountry = places[0].country
					citypre = JSON.stringify
						"name": places[0].city
						"url": "madrid"
						#"url": places[0].city.toLowerCase()
					city = JSON.parse(citypre)
					root.fetchDeals(city)
					root.gpsFetchCities = () ->
						#root.fetchCities(gpsCountry.toLowerCase())
					root.gpsFetchDeals = () ->
						#	root.fetchDeals(city)
				else 
					Ti.API.error("No address found")
					Ti.API.debug("reverse geolocation result = "+JSON.stringify(evt))
					return root.fetchCountries()
			else 
				Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:evt.error}).show()
				errorDialog.show()
				Ti.API.info("Code translation: "+translateErrorCode(e.code))
				Titanium.API.info('geo - location updated: ' + new Date(timestamp) + ' long ' + longitude + ' lat ' + latitude + ' accuracy ' + accuracy)
		locationAdded = true
		root.hideLoading(root.countriesWindow)
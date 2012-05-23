Ti.Geolocation.preferredProvider = "gps"
Ti.Geolocation.purpose = "Get Current Location"
locationAdded = false
root.gpsCountry = undefined
root.gpsCity = undefined

Number.prototype.toDeg = () ->
	return this * 180 / Math.PI

Number.prototype.toRad = () ->
	return this * Math.PI / 180

getNearCity = (lat,lon) ->
	R = 6371
	lowDistance = 1000
	nearCity = undefined
	allcities = []
	staticCities = root.staticCities.concat root.staticOtherCities
	Ti.API.info '************** LONG de listCities = ' + root.listCities.length
	if root.listCities.length > staticCities.length
		allCities = root.listCities
	else
		allCities = staticCities
	for city in allCities
		cityLatRad = city.latitude * Math.PI / 180
		latRad =  lat * Math.PI / 180
		dLat = (city.latitude - lat) * Math.PI / 180
		dLon = (city.longitude - lon) * Math.PI / 180
		a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(latRad) * Math.cos(cityLatRad) * Math.sin(dLon/2) * Math.sin(dLon/2)
		c = 2 * Math.atan2(Math.sqrt(a),Math.sqrt(1-a))
		distance = R * c
		Ti.API.info 'City: ' + city.name + ' distance: ' + distance
		if distance < lowDistance 
			nearCity = city
			lowDistance = distance
	if lowDistance < 100 and nearCity isnt undefined
		Ti.API.info '+++ GPS Encontrada NEARCITY = ' + nearCity.name
		root.loadDeals(nearCity)
	else 
		Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:L('noDealsGPS')}).show()
		root.hideLoading(root.citiesWindow)

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
		Ti.API.info 'Entra en geo off'
		Titanium.UI.createAlertDialog({title:'ReallyLateBooking',message:L('geoOff')}).show()
		return root.hideLoading(root.citiesWindow)
	
	authorization = Titanium.Geolocation.locationServicesAuthorization
	if authorization is Titanium.Geolocation.AUTHORIZATION_DENIED
		Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:L('youGeoDisallow')}).show()
		return root.hideLoading(root.citiesWindow)
	else if authorization is Titanium.Geolocation.AUTHORIZATION_RESTRICTED
		Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:L('systemGeoDisallow')}).show()
		return root.hideLoading(root.citiesWindow)
	root.getGPSData()	


root.getGPSData = () ->
	Titanium.Geolocation.accuracy = Titanium.Geolocation.ACCURACY_HIGH
	Titanium.Geolocation.distanceFilter = 10
	Titanium.Geolocation.getCurrentPosition (e) ->
		Ti.API.info "Entra en getCurrentPosition " 
		if  (!e.success || e.error)
			Ti.API.info("Code translation: "+translateErrorCode(e.code))
			Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:L('geoOff')}).show()
			root.hideLoading(root.citiesWindow)
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
		getNearCity(latitude,longitude)
		Titanium.API.info('geo - current location: ' + new Date(timestamp) + ' long ' + longitude + ' lat ' + latitude + ' accuracy ' + accuracy)
		locationAdded = true
		
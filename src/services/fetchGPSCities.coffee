root.xhrGPSCities = Titanium.Network.createHTTPClient(timeout:15000)

root.xhrGPSCities.onload = () ->
	root.listCities = []
	Ti.API.info 'Entra en carga correcto'
	Ti.API.info(this.responseText)
	root.citiesLastUpdate = new Date()
	listCities = JSON.parse(this.responseText)
	if listCities.length > 10
		for city in listCities
			if city.isRoot
				root.listCities.push(city)
	root.initializeGPS() 

root.xhrGPSCities.onerror = (e) ->
	Ti.API.info "Entra en error de ciudades GPS " + e.error
	#root.initializeGPS() 

if Titanium.Network.online is false
	Ti.API.info "Error ciudades GPS no hay Internet"
else
	root.xhrGPSCities.open('GET', root.url+'/v2/cities')
	root.xhrGPSCities.setRequestHeader("Accept-Language",Titanium.Locale.currentLanguage)
	root.xhrGPSCities.send()
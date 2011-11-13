root.xhrCities = Titanium.Network.createHTTPClient()
root.citiesDate = {}
root.listCities = {}

root.xhrCities.onload = () ->
	Ti.API.info 'Entra en carga correcto'
	Ti.API.info(this.responseText)
	root.citiesDate[root.cityUrl] = new Date()
	root.listCities[root.cityUrl] = JSON.parse(this.responseText)
	if root.listCities[root.cityUrl].length > 0
		root.populateCitiesTable(root.listCities[root.cityUrl])
		if root.isGPS
			root.gpsFetchDeals()
			root.isGPS = false

root.xhrCities.onerror = () ->
	Ti.API.info "Entra en error de ciudades onerror"
	root.hideLoading(root.citiesWindow)
	root.showError(root.citiesWindow)


root.fetchCities = (url)->
	Ti.API.info "Entra en get Cities con " + url
	if Titanium.Network.online is false
		Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:L('mustInternet')}).show()
		root.showError(root.citiesWindow)
	else
		root.cityUrl = url
		now = new Date()
		if root.citiesDate[url] is undefined
			diffTime =  86500000
		else
			diffTime = now.getTime() - root.citiesDate[url].getTime()
			Ti.API.info 'last cities updated: ' + root.citiesDate[url].toLocaleDateString() + 'difftime: ' + diffTime
		if root.listCities[url] is undefined or diffTime > 86400000 or root.listCities[url].length is 0
			root.xhrCities.setTimeout(15000)
			root.xhrCities.open('GET', root.url+'/cities/'+url)
			root.xhrCities.setRequestHeader("Accept-Language",Titanium.Locale.currentLanguage)
			root.xhrCities.send()
		else
			Ti.API.info "No se necesita cargar ciudades"
			root.populateCitiesTable(root.listCities[root.cityUrl])
		
		
	
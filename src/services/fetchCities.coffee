root.xhrCities = Titanium.Network.createHTTPClient()

root.xhrCities.onload = () ->
	Ti.API.info 'Entra en carga correcto'
	Ti.API.info(this.responseText)
	root.citiesLastUpdate = new Date()
	root.listCities = JSON.parse(this.responseText)
	if root.listCities.length > 0
		root.hideLoading(root.allCitiesWindow)
		root.populateCitiesTable(root.listCities)

root.xhrCities.onerror = (e) ->
	Ti.API.info "Entra en error de ciudades onerror " + e.error
	root.hideLoading(root.allCitiesWindow)
	Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:'Error: ' + L('conectionError')}).show()
	root.allCitiesWindow.close()
	#root.showError(root.citiesWindow)


root.fetchCities = ()->
	Ti.API.info "Entra en get Cities"
	if Titanium.Network.online is false
		Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:L('mustInternet')}).show()
		root.showError(root.allCitiesWindow)
	else
		now = new Date()
		if root.listCities is undefined
			diffTime =  43300000
		else
			diffTime = now.getTime() - root.citiesLastUpdate.getTime()
			Ti.API.info 'last cities updated: ' + root.citiesLastUpdate.toLocaleDateString() + 'difftime: ' + diffTime
		if root.listCities is undefined or diffTime > 43200000 or root.listCities.length is 0
			root.showLoading(root.allCitiesWindow)
			root.xhrCities.setTimeout(15000)
			root.xhrCities.open('GET', root.url+'/v2/cities')
			Ti.API.info 'GET cities from: ' + root.url+'/v2/cities'
			root.xhrCities.setRequestHeader("Accept-Language",Titanium.Locale.currentLanguage)
			root.xhrCities.send()
		else
			Ti.API.info "No se necesita cargar ciudades"
			root.populateCitiesTable(root.listCities)

root.mockFetchCities = () ->
	Ti.API.info "Entra en cargar ciudades estatíco"
	root.populateCitiesTable(root.staticCities)
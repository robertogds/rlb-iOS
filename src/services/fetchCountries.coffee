root.countriesDate = new Date()
root.listCountries = undefined
root.xhrCountries = Titanium.Network.createHTTPClient()

root.xhrCountries.onload = () ->
	Ti.API.info(this.responseText)
	root.listCountries = JSON.parse(this.responseText)
	root.populateCountriesTable(root.listCountries)
	if root.isGPS 
		root.gpsFetchCities()

root.xhrCountries.onerror = () ->
	root.hideLoading(root.countriesWindow)
	root.showError(root.countriesWindow)

root.fetchCountries = () ->
	if Titanium.Network.online is false
		Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:L('mustInternet')}).show()
		root.showError(root.countriesWindow)
	else
		now = new Date()
		diffTime = now.getTime() - root.countriesDate.getTime()
		Ti.API.info 'last countries updated: ' + root.countriesDate.toLocaleDateString() + 'difftime: ' + diffTime
		if root.listCountries is undefined or diffTime > 86400000 or root.listCountries.length is 0
			Ti.API.info 'Fetch the list of Countries calling internet'
			root.xhrCountries.setTimeout(15000)
			root.showLoading(root.countriesWindow)
			root.xhrCountries.open('GET', root.url+'/countries')
			root.xhrCountries.setRequestHeader("Accept-Language",Titanium.Locale.currentLanguage)
			root.xhrCountries.send()
		else
			Ti.API.info 'Not necceseary call internet for fetching Countries'
			root.populateCountriesTable(root.listCountries)

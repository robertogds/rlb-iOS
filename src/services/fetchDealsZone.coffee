root.xhrDealsZone = Titanium.Network.createHTTPClient()

root.xhrDealsZone.onload = () ->
	Ti.API.info "**** en fetchdealsZone obtenemos: " + this.responseText
	root.hideLoading(root.citiesWindow)
	deals = JSON.parse(this.responseText)
	alert 'Entra en onload zones con zone: ' + this.zone.name
	if deals.status is undefined 
		Ti.API.error "Entra en undefined OK"
		root.addDealsZone(deals,this.zone)

root.xhrDealsZone.onerror = () ->
	root.hideLoading(root.citiesWindow)
	Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:L('errorHappened')}).show()
	root.hideLoading(root.listDealsWindow)
	root.showError(root.citiesWindow)
	
	
root.fetchDealsZone = (zone) ->
	if Titanium.Network.online is false
		Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:L('mustInternet')}).show()
		root.showError(root.citiesWindow)
	else
		root.xhrDealsZone.zone = zone
		root.xhrDealsZone.setTimeout(15000)
		Ti.API.info "LLamamamos a: " + root.url+'/deals/'+zone.url
		root.xhrDealsZone.open('GET', root.url+'/deals/'+zone.url)
		root.xhrDealsZone.setRequestHeader("Accept-Language",Titanium.Locale.currentLanguage)
		root.xhrDealsZone.send()
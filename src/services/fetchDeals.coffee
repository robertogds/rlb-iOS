root.xhrDeals = Titanium.Network.createHTTPClient()

root.xhrDeals.onload = () ->
	Ti.API.info "****** en fetchdeals obtenemos: " + this.responseText
	root.hideLoading(root.citiesWindow)
	root.hideLoading(root.allCitiesWindow)
	deals = JSON.parse(this.responseText)
	if deals.status is undefined 
		root.showDeals(deals)
	else
		if deals.status is 0
			Ti.API.info '**** Entra en waitingCity'
			root.showNoDeals(deals.message)

root.xhrDeals.onerror = () ->
	root.hideLoading(root.citiesWindow)
	root.hideLoading(root.allCitiesWindow)
	Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:L('errorHappened')}).show()
	root.hideLoading(root.listDealsWindow)
	root.showError(root.citiesWindow)
	
	
root.fetchDeals = (city) ->
	if Titanium.Network.online is false
		Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:L('mustInternet')}).show()
		root.showError(root.citiesWindow)
	else
		root.xhrDeals.setTimeout(25000)
		root.xhrDeals.open('GET', root.url+'/v2/deals/'+city.url)
		#root.xhrDeals.open('GET', root.url+'/deals/'+city.url)
		root.xhrDeals.setRequestHeader("Accept-Language",Titanium.Locale.currentLanguage)
		root.xhrDeals.send()
		
root.fetchDealsFake = () ->
	deals = [
		{
			'hotelName' : 'Petit Palace Embassy'
			'salePriceCents' : 140
			'roomType' : 'lujo'
			'priceCents' : 250
		}
		{
			'hotelName' : 'Hotel Regina'
			'salePriceCents' : 135
			'roomType' : 'elegante'
			'priceDay2' : 110 
			'priceCents' : 200
			
		}
		{
			'hotelName' : 'Vincci Soho'
			'salePriceCents' : 120
			'roomType' : 'confort'
			'priceCents' : 180
		}
	]
	root.populateDealsTable(deals)
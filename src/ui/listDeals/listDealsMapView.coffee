root.listDealsMapView = Titanium.Map.createView
  mapType: Titanium.Map.STANDARD_TYPE
  top: 0
  width: '100%'
  height: '98%'
  animate: true
  regionFit: true
  userLocation: true

root.mbv = []

root.listDealsMapWindow.add(root.listDealsMapView)

root.createMap = (deals) ->
	root.annotations = []
	region =
		latitudeDelta: 0.07
		longitudeDelta: 0.07
		latitude: root.city.latitude
		longitude: root.city.longitude
	a = 0
	for deal in deals
		Ti.API.info '****** COORD CIUDAD =  ' + deal.city.longitude + ' ' + deal.city.latitude
		#region.latitude = deal.city.latitude
		#region.longitude = deal.city.longitude
		subtitle = L('tonight') + ': ' + deal.salePriceCents + '€'
		root.mbv[a]  = new root.GenericMapRightButtonView(deal).view
		root.mbv[a].addEventListener 'click', (e) ->
			root.showDealView(e.source.deal)
			root.tabGroup.tabs[root.dealsTab.pos].open(root.oneDealWindow,{animated:true})
		root.annotations[a] = new root.GenericMapAnnotation(deal.id,deal.latitude,deal.longitude,deal.hotelName,subtitle,root.mbv[a]).annotation
		root.listDealsMapView.addAnnotation(root.annotations[a])
		a++
	root.listDealsMapView.region = region
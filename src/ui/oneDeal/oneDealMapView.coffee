root.mapView = Titanium.Map.createView
	mapType: Titanium.Map.STANDARD_TYPE
	top: 40
	width: '100%'
	height: '98%'
	region:
		latitudeDelta:0.02
		longitudeDelta:0.02
	animate: true
	regionFit: true
	userLocation: true
	#annotations: [hotelAnnotation]

root.createDealMap = (deal) ->
	root.mapView.removeAllAnnotations()	
	mapButtonView = new root.GenericMapRightButtonView(null).view
	mapButtonView.addEventListener 'click', (e) ->
		Ti.API.info 'Entra en mapButtonView click'
		root.oneDealButtonBar.index = 0
		root.oneDealWindow.remove root.infoDealTable
		root.oneDealWindow.remove root.mapView
		root.oneDealWindow.add root.oneDealView
		
	#subtitle = L('tonight') + ': ' + deal.salePriceCents + '€'
	subtitle = deal.address
	hotelAnnotation = new root.GenericMapAnnotation(deal.id,deal.latitude,deal.longitude,deal.hotelName,subtitle,mapButtonView).annotation
	root.mapView.addAnnotation hotelAnnotation
	region =
		latitude: deal.latitude
		longitude: deal.longitude
		latitudeDelta: 0.01
		longitudeDelta: 0.01
		
	root.mapView.region = region
	root.mapView.setLocation region
	root.oneDealWindow.remove root.mapView


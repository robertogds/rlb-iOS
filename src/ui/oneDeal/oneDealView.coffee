Ti.include('/js/oneDealButtonBar.js')

root.oneDealView = Titanium.UI.createView
	backgroundColor:'black'
	width: Ti.Platform.displayCaps.platformWidth
	top: 40

root.oneDealImage = Titanium.UI.createImageView
	defaultImage: '/images/completo10_loading.jpg'
	top: 0
	width: 320
	height: 330


root.oneDealView.add(root.oneDealImage)

root.oneDealImage.addEventListener 'click', (e) ->
	root.imagesWindow.add(root.imagesScrollView)
	root.tabGroup.tabs[root.dealsTab.pos].open(root.imagesWindow,{animated:true})

root.oneDealAddressLabel = Titanium.UI.createLabel
	top: 0
	width: Ti.UI.FILL
	height: '100%'
	textAlign: 'left'
	color: '#fff'
	font:
		fontSize: 12
		fontFamily:'Helvetica Neue'
		fontWeight: 'bold'
	left: 20

#addressView.add(root.oneDealAddressLabel)

root.titleView = Titanium.UI.createView
	width: Ti.UI.FILL
	backgroundColor:'transparent'
	top: 0
	height: 50

root.hotelNameLabel = Titanium.UI.createLabel
	width: Ti.UI.FILL
	top:8
	textAlign: 'center'
	color: 'white'
	text: 'Hotel'
	font:
		fontFamily:'Helvetica Neue'
		fontWeight: 'bold'
		fontSize: 20
	height: 20
	
root.hotelAddressLabel = Titanium.UI.createLabel
	width: Ti.UI.FILL
	top:26
	textAlign: 'center'
	color: '#868d92'
	text: ''
	font:
    	fontSize: 12
		fontFamily:'Helvetica Neue'
		fontWeight: 'bold'
	height: 20
	
root.titleLabel = Titanium.UI.createLabel
	width: Ti.UI.FILL
	top: 0
	height: '100%'
	color: '#fff'
	textAlign: 'center'
	font:
		fontSize: 12
		fontFamily:'Helvetica Neue'
		fontWeight: 'bold'
	left: 0


root.titleView.add(root.hotelNameLabel)
root.titleView.add(root.hotelAddressLabel)

root.oneDealView.add(root.priceView)
root.oneDealView.add(root.bookingButtonLabel)
root.oneDealWindow.add(root.oneDealButtonBarView)
root.oneDealWindow.add(root.oneDealView)

separator1 = new root.GenericSeparatorView(230).view
#root.oneDealView.add(separator1)

separator2 = new root.GenericSeparatorView(265).view
root.oneDealView.add(separator2)


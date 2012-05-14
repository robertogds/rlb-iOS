root.closeBookingButton = new root.GenericButton(400,L('close')).button

root.oneBookingView = Titanium.UI.createView
	top: 0
	
root.oneBookingDataView = Titanium.UI.createView()
root.oneBookingWindow.add(root.oneBookingDataView)

headerLabel = Titanium.UI.createLabel
	width: Ti.UI.FILL
	borderWidth: 0
	borderColor: '#3e565e'
	backgroundColor: 'black'
	color: '#fff'
	height: 40
	top: 0
	
root.oneBookingTitleLabel = Titanium.UI.createLabel
	height: 30
	top: 5
	color: '#fff'
	left: 10
	font:
		fontSize: 20
		fontWeight: 'bold'

bookingDataTitle = new root.GenericTitleLabel(50,L('bookingData') + ': ').label
clientTitle  = new root.GenericTitleLabel(220,L('clientData')+': ').label
rememberTitle = new root.GenericTitleLabel(310,L('remember')+': ').label

root.oneBookingView.add(headerLabel)
root.oneBookingView.add(root.oneBookingTitleLabel)
root.oneBookingView.add(bookingDataTitle)
root.oneBookingView.add(clientTitle)
root.oneBookingView.add(rememberTitle)

hotelSubtitle = new root.GenericSubtitleLabel(70,L('hotel')+': ').label
addressSubtitle = new root.GenericSubtitleLabel(90,L('address')+': ').label
roomSubtitle = new root.GenericSubtitleLabel(110,L('room')+': ').label
nightsSubtitle = new root.GenericSubtitleLabel(130,L('nights') + ': ').label
regimenSubtitle = new root.GenericSubtitleLabel(150,L('regime') + ': ').label
regularPriceSubtitle = new root.GenericSubtitleLabel(170,L('regularPrice')+': ').label
salePriceSubtitle = new root.GenericSubtitleLabel(190,L('salePrice')+': ').label
firstNameSubtitle = new root.GenericSubtitleLabel(240,L('firstName')+': ').label
lastNameSubtitle = new root.GenericSubtitleLabel(260,L('lastName')+': ').label
emailSubtitle = new root.GenericSubtitleLabel(280,L('email')+': ').label


remember1 = new root.GenericTextLabel(340,10,L('bookPaid')).label

root.oneBookingView.add(hotelSubtitle)
root.oneBookingView.add(addressSubtitle)
root.oneBookingView.add(roomSubtitle)
root.oneBookingView.add(nightsSubtitle)
root.oneBookingView.add(regimenSubtitle)
root.oneBookingView.add(regularPriceSubtitle)
root.oneBookingView.add(salePriceSubtitle)
root.oneBookingView.add(firstNameSubtitle)
root.oneBookingView.add(lastNameSubtitle)
root.oneBookingView.add(emailSubtitle)
root.oneBookingView.add(remember1)

root.closeBookingButton.addEventListener 'click', (e) ->
	root.confirmBookingWindow.close()
	root.oneDealWindow.close()
	root.oneBookingWindow.close() 
	root.tabGroup.setActiveTab(1)
	
root.oneBookingWindow.add(root.oneBookingView)


root.showOneBookingView = (@booking) ->
	Ti.API.info booking
	if booking.breakfastIncluded is 1
		regimenText = L('breakfastYes')
	else
		regimenText = L('breakfastNo')
	root.oneBookingWindow.remove(root.oneBookingDataView)
	root.oneBookingDataView = Titanium.UI.createView()
	hotelName = new root.GenericTextLabel(70,90,booking.hotelName).label
	hotelAddress = new root.GenericTextLabel(90,90,booking.dealAddress).label
	roomType = new root.GenericTextLabel(110,90,L('double')).label
	nights = new root.GenericTextLabel(130,90,booking.nights).label
	regimen = new root.GenericTextLabel(150,90,regimenText).label
	regularPrice = new root.GenericTextLabel(170,90,booking.priceCents+ '€ ').label
	salePrice = new root.GenericTextLabel(190,90,booking.salePriceCents+ '€ ').label
	firstName = new root.GenericTextLabel(240,90,booking.bookingForFirstName).label
	lastName = new root.GenericTextLabel(260,90,booking.bookingForLastName).label
	email = new root.GenericTextLabel(280,90,booking.bookingForEmail).label
	title = L('booking') + ' : ' + booking.code
	root.oneBookingTitleLabel.text = title
	text = L('hotel')+': ' + booking.hotelName + '\n'+L('checkin')+': ' + booking.checkinDate + '\n'
	text = text + L('nights') + ': ' + booking.nights + '\n\n'
	text = text + L('salePrice')+': ' + booking.salePriceCents + '€ '+L('regularPrice')+': ' + booking.priceCents + ' € \n\n\n'
	text = text + L('oneBookingText')
	root.oneBookingDataView.add(hotelName)
	root.oneBookingDataView.add(hotelAddress)
	root.oneBookingDataView.add(roomType)
	root.oneBookingDataView.add(nights)
	root.oneBookingDataView.add(regimen)
	root.oneBookingDataView.add(regularPrice)
	root.oneBookingDataView.add(salePrice)
	root.oneBookingDataView.add(firstName)
	root.oneBookingDataView.add(lastName)
	root.oneBookingDataView.add(email)
	
	root.oneBookingDataView.add(root.closeBookingButton)
	root.oneBookingWindow.add(root.oneBookingDataView)

	root.oneBookingWindow.backButtonTitle = Ti.Locale.getString('close') 
	root.oneBookingWindow.open
		modal:true
		modalTransitionStyle: Ti.UI.iPhone.MODAL_TRANSITION_STYLE_FLIP_HORIZONTAL
		modalStyle: Ti.UI.iPhone.MODAL_PRESENTATION_FORMSHEET
		navBarHidden:true





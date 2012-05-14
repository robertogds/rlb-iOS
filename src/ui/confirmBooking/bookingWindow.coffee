root.showConfirmBooking = ()->
	root.hotelLabel.text = root.deal.hotelName
	root.priceLabel.text = root.deal.salePriceCents + ' €' 
	root.checkinDate = new Date(root.deal.checkinDate)
	root.checkoutDate = new Date(root.checkinDate.getTime() + 86400000)
	root.checkinLabel.text = root.getLocaleDateString(root.checkinDate)
	root.checkoutLabel.text = root.getLocaleDateString(root.checkoutDate)
	Ti.API.info '*** Abre la pantalla de bookingWindow'	
	root.tabGroup.activeTab.open(root.confirmBookingWindow,{animated:true})

root.confirmBookingWindow.addEventListener 'focus', (e) ->
	Ti.API.info 'Entra en confirmBooking'
	if root.bookingForFirstName is null or root.bookingForFirstName is undefined
		Ti.API.info 'bookingForFirstName is null'
		root.bookingForEmail = root.user.email
		root.bookingForFirstName = root.user.firstName
		root.bookingForLastName = root.user.lastName
		root.bookingForEmailLabel.text = root.user.email
		root.bookingForNameLabel.text = root.user.firstName + ' ' + root.user.lastName
	else
		Ti.API.info 'bookingforfirstname isnt null: ' + root.bookingForFirstName
		root.bookingForNameLabel.text = root.bookingForFirstName + ' ' + root.bookingForLastName
		root.bookingForEmailLabel.text = root.bookingForEmail
	if Titanium.App.Properties.hasProperty("creditCard")
		root.creditCard = JSON.parse(Titanium.App.Properties.getString("creditCard"))
		root.cardTypeLabel.text = root.creditCard.type
		root.cardNumberText.value = root.creditCard.number
		root.cardNameText.value = root.creditCard.name
		root.expireMonthText.value = root.creditCard.expireMonth
		root.expireYearText.value = root.creditCard.expireYear
		root.cvcCodeText.value = root.creditCard.cvc
	root.priceLabel.text = root.totalPrice + ' €'
	if root.bookingNights > 1
		root.totalLabel.text = L('total') + ' ' + root.bookingNights + ' ' + L('nights') + ':' 
	else
		root.totalLabel.text = L('total') + ' 1 ' + L('night') + ':'
	root.checkoutLabel.text = root.getLocaleDateString(root.checkoutDate)
	Ti.API.info "************** " + root.cardNumberText.value
	if root.cardNumberText.value is null or root.cardNumberText.value < 10 
		Ti.API.info "************** ENTRA EN NO HAY TIPO DE TARJETA"
		root.paymentLabel.text = L('noPaymentInfo')
	else root.paymentLabel.text = L('creditCard') + ':  ' + root.cardTypeLabel.text + '   ' + root.cardNumberText.value
	Ti.API.info("Sale bookingWindow focus >>>>>>>>")


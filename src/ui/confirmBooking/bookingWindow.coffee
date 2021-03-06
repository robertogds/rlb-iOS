root.showConfirmBooking = ()->
	root.hotelLabel.text = root.deal.hotelName
	root.hotelAddress.text = root.deal.address
	root.priceLabel.text = root.deal.salePriceCents + ' €' 
	root.priceFinal = root.deal.salePriceCents - root.totalCredit
	if root.priceFinal < 1 
		root.priceFinal = 0
	root.priceFinalLabel.text = root.priceFinal + ' €'
	root.priceCreditsLabel.text = root.totalCredit + ' €'
	
	root.checkinDate = new Date(root.deal.checkinDate)
	root.checkoutDate = new Date(root.checkinDate.getTime() + 86400000)
	root.checkinLabel.text = root.getLocaleDateString(root.checkinDate)
	root.checkoutLabel.text = root.getLocaleDateString(root.checkoutDate)
	Ti.API.info '*** Abre la pantalla de bookingWindow'	
	if root.deal.breakfastIncluded is true
		root.regimenLabel.text = L('breakfastYes')
	else
		root.regimenLabel.text = L('breakfastNo')
	root.tabGroup.tabs[root.dealsTab.pos].open(root.confirmBookingWindow,{animated:true})

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
		root.totalLabel.text = L('total') + ' ' + root.bookingNights + ' ' + L('nights')
	else
		root.totalLabel.text = L('total') + ' 1 ' + L('night')
	root.checkoutLabel.text = root.getLocaleDateString(root.checkoutDate)
	Ti.API.info "************** " + root.cardNumberText.value
	if root.cardNumberText.value is null or root.cardNumberText.value < 10 
		Ti.API.info "************** ENTRA EN NO HAY TIPO DE TARJETA"
		root.paymentLabel.text = L('noPaymentInfo')
	else root.paymentLabel.text = L('creditCard') + ':  ' + root.cardTypeLabel.text + '   ' + root.cardNumberText.value
	root.priceFinal = root.totalPrice - root.totalCredit
	if root.priceFinal < 1 
		root.priceFinal = 0
	root.priceFinalLabel.text = root.priceFinal + ' €'
	root.priceCreditsLabel.text = root.totalCredit + ' €'
	Ti.API.info("Sale bookingWindow focus >>>>>>>>")


root.xhrBooking = Titanium.Network.createHTTPClient()

root.xhrBooking.onload = (e) ->
	Ti.API.info this.responseText
	Ti.API.info '_____________________ ENTRA EN COMPRA CON EXITO ********************'
	root.hideLoading(root.confirmBookingWindow)
	try
		response = JSON.parse(this.responseText)
	catch error
		Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:L('errorBooking')}).show()
	Ti.API.info(response)
	if response.status is 201
		root.showOneBookingView(response.content)
	else
		Ti.API.error 'error de compra'
		Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:'Error: ' + response.detail}).show()

root.xhrBooking.onerror = (e) ->
	root.hideLoading(root.confirmBookingWindow)
	root.showError()
	Ti.API.error(e)

root.doBooking = () ->
	Ti.API.info '_____________________ ENTRA EN COMPRAR ********************'
	root.showLoading(root.confirmBookingWindow)
	root.xhrBooking.setTimeout(15000)
	url = root.urlSignature('/booking')
	signature = root.doSignature(url)
	url = url + '/' + signature
	root.xhrBooking.open("POST",root.surl+url)
	root.xhrBooking.setRequestHeader("Content-Type","application/json; charset=utf-8")
	root.xhrBooking.setRequestHeader("Accept-Language",Titanium.Locale.currentLanguage)
	newBook = JSON.stringify
		"userId": root.user.id
		"dealId": root.deal.id
		"nights": root.bookingNights
		"creditCardType": root.cardType
		"creditCard" : root.cardNumberText.value
		"creditCardName": root.cardNameText.value
		"creditCardExpiry": root.expireMonthText.value + '/' + root.expireYearText.value
		"creditCardCVC": root.cvcCodeText.value
		"bookingForEmail": root.bookingForEmail
		"bookingForFirstName": root.bookingForFirstName
		"bookingForLastName": root.bookingForLastName
	Ti.API.info(newBook)
	Ti.API.info 'Paso pre-compra'
	root.xhrBooking.send(newBook)
	Ti.API.info 'Paso post-compra'

root.returnCardType = (number) ->
	if /^4[0-9]{12}(?:[0-9]{3})?$/.test(number)
		return 'Visa'
	else if /^5[1-5][0-9]{14}$/.test(number)
		return 'Mastercard'
	else if /^5[1-5][0-9]{14}$/.test(number)
		return 'American Express'
	else return "WRONG"	

root.validateBookingData = () ->
	return Ti.Locale.getString('errorUser') unless root.user.id > 0
	return Ti.Locale.getString('errorNoDeal') unless root.deal.id > 0
	#return Ti.Locale.getString('errorCardNumber') if root.returnCardType(root.cardNumberText.value) is 'WRONG'
	#return Ti.Locale.getString('errorCardNumber') unless root.cardNumberText.value.length > 12
	#return Ti.Locale.getString('errorCardName') unless root.cardNameText.value.length > 2
	#return Ti.Locale.getString('errorExpires') unless root.expireMonthText.value.length is 2	
	#return Ti.Locale.getString('errorExpires') unless root.expireYearText.value > 11
	#return Ti.Locale.getString('errorExpires') unless root.expireYearText.value.length is 2
	#return Ti.Locale.getString('errorcvcCode') unless root.cvcCodeText.value.length > 2
	#return Ti.Locale.getString('errorcvcCode') unless root.cvcCodeText.value.length < 5
	return true 
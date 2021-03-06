root.paymentView = Titanium.UI.createView
	background: 'transparent'
	borderWidth: 0
	width:320
	top: 0
		
cardLabel = Titanium.UI.createLabel
	text: 'Introduce los datos de la tarjeta de crédito:'
	textAlign: 'left'
	width: 280
	color: '#fff'
	font:
		fontSize: 14
		fontWeight: 'bold'
	height: 40
	top: 10
	

cardTypesIcon = Titanium.UI.createImageView
	image:'/images/cardTypes200.jpg'
	top: 200

root.cardNumberText = Titanium.UI.createTextField
	backgroundColor: '#fff'
	width: '280'
	height: '44'
	color:'#336699'
	hintText: L('number')
	clearOnEdit: false
	paddingLeft: 10
	top: 15
	keyboardType: Titanium.UI.KEYBOARD_NUMBERS_PUNCTUATION 
	returnKeyType: Titanium.UI.RETURNKEY_NEXT
	maxLength: 16

root.cardNumberText.addEventListener 'return', (e) ->
	root.expireMonthText.focus()
	
root.expireMonthText = Titanium.UI.createTextField
	backgroundColor: '#fff'
	height: 44
	width: 60
	left: 20
	top: 73
	color:'#336699'
	hintText: 'MM'
	paddingLeft: 10
	clearOnEdit: false
	keyboardType: Titanium.UI.KEYBOARD_NUMBERS_PUNCTUATION
	returnKeyType: Titanium.UI.RETURNKEY_NEXT
	maxLength: 2

root.expireMonthText.addEventListener 'return', (e) ->
	root.expireYearText.focus()

root.expireYearText = Titanium.UI.createTextField
	backgroundColor: '#fff'
	height: 44
	width: 60
	left: 95
	top: 73
	color:'#336699'
	hintText: L('expiresYear')
	paddingLeft: 10
	clearOnEdit: false
	keyboardType: Titanium.UI.KEYBOARD_NUMBERS_PUNCTUATION
	returnKeyType: Titanium.UI.RETURNKEY_NEXT
	maxLength: 2

root.expireYearText.addEventListener 'return', (e) ->
	root.cvcCodeText.focus()

slashLabel = Titanium.UI.createLabel
	text: '/'
	textAlign: 'center'
	width: 20
	height: 44
	color: 'white'
	font:
		fontSize: 18
		fontWeight: 'bold'
	top: 73
	left: 77

cvcIcon = Titanium.UI.createImageView
	image:'/images/cvcCard.jpg'
	left: 245
	top: 79

root.cvcCodeText = Titanium.UI.createTextField
	backgroundColor: '#fff'
	height: 44
	width: 65
	left: 175
	top: 73
	color:'#336699'
	hintText: 'CVC'
	paddingLeft: 10
	clearOnEdit: false
	keyboardType: Titanium.UI.KEYBOARD_NUMBERS_PUNCTUATION
	returnKeyType: Titanium.UI.RETURNKEY_NEXT
	maxLength: 3

root.cvcCodeText.addEventListener 'return', (e) ->
	root.cardNameText.focus()
	
	
root.cardNameText = Titanium.UI.createTextField
	backgroundColor: '#fff'
	width: '280'
	height: '44'
	top: 130
	color:'#336699'
	hintText: L('cardName')
	clearOnEdit: false
	paddingLeft: 10
	returnKeyType: Titanium.UI.RETURNKEY_DONE

root.cardNameText.addEventListener 'return', (e) ->
	root.cardNameText.blur()
	root.savePayment()
	
	
verisignIcon = Titanium.UI.createImageView
	image:'/images/verisign_secured2.png'
	top: 250

	
savePaymentButton = new root.GenericButton(320,L('save')).button

savePaymentButton.addEventListener 'click', (e) ->
	root.savePayment()
		
root.savePayment = () ->
	validate = root.validateBookingData()
	if validate isnt true
		Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:L('reviewData') + ': ' + validate}).show()
	else
		root.cardType = root.returnCardType(root.cardNumberText.value)
		creditCard = JSON.stringify
			"type": root.cardType
			"number": root.cardNumberText.value
			"name": root.cardNameText.value
			"expireMonth": root.expireMonthText.value
			"expireYear": root.expireYearText.value
			"cvc": root.cvcCodeText.value
		Titanium.App.Properties.setString("creditCard",creditCard)
		root.paymentWindow.close()
	
#root.paymentView.add(cardLabel)
root.paymentView.add(verisignIcon)
root.paymentView.add(cardTypesIcon)
root.paymentView.add(root.cardNumberText)
root.paymentView.add(root.cardNameText)
root.paymentView.add(root.expireYearText)
root.paymentView.add(root.expireMonthText)
root.paymentView.add(root.cvcCodeText)
root.paymentView.add(slashLabel)
root.paymentView.add(cvcIcon)
root.paymentView.add(savePaymentButton)
#root.paymentView.add(root.zoozButton)

root.paymentWindow.add(root.paymentView)
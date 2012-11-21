Ti.include(
	'/js/expiresView.js'
	'/js/creditCardTable.js'
	'/js/paymentView.js'
	'/js/nightsView.js'
	'/js/bookingAction.js'
	'/js/bookingWindow.js'
	'/js/bookingForView.js'
	'/js/confirmTable.js'
)
root.bookingView = Titanium.UI.createView
	backgroundColor: '#010101'
	borderWidth: 0
	top: 0

root.hotelLabel = Titanium.UI.createLabel
	top:4
	height: 28
	textAlign: 'center'
	font:
		fontSize: 20
		fontWeight: 'bold'
	color: '#fff'

root.hotelAddress = Titanium.UI.createLabel
	top:30
	height: 20
	textAlign: 'center'
	font:
		fontSize: 12
		fontWeight: 'bold'
	color: '#fff'	

root.totalLabel = Titanium.UI.createLabel
	top:60
	width:110
	height: 28
	textAlign: 'center'
	color: '#868d92'
	font:
		fontSize: 14
		fontWeight: 'bold'
	left: 10


yourCreditsLabel = Titanium.UI.createLabel
	top:60
	width: 90
	height: 28
	text: L('credits').toUpperCase()
	textAlign: 'center'
	color: '#868d92'
	font:
		fontSize: 14
		fontWeight: 'bold'
	left: 120
	
totalFinalLabel = Titanium.UI.createLabel
	top:60
	height: 28
	width: 90
	textAlign: 'center'
	text: L('total').toUpperCase()
	color: '#868d92'
	font:
		fontSize: 14
		fontWeight: 'bold'
	left: 230

minusLabel = Titanium.UI.createLabel
	top:85
	height: 28
	text: '-'
	color: '#868d92'
	font:
		fontSize: 24
		fontWeight: 'bold'
	left: 120

equalsLabel = Titanium.UI.createLabel
	top:85
	height: 28
	text: '='
	color: '#868d92'
	font:
		fontSize: 24
		fontWeight: 'bold'
	left: 210


root.priceLabel = Titanium.UI.createLabel
	top:90
	height: 24 
	width: 110
	color: '#fff'
	textAlign: 'center'
	font:
		fontSize: 22
		fontWeight: 'bold'
	left: 10

root.priceCreditsLabel = Titanium.UI.createLabel
	top:90
	height: 24 
	width:90
	color: '#fff'
	textAlign: 'center'
	font:
		fontSize: 22
		fontWeight: 'bold'
	left: 120

root.priceFinalLabel = Titanium.UI.createLabel
	top:90
	height: 24 
	width: 90
	color: '#fff'
	textAlign: 'center'
	font:
		fontSize: 22
		fontWeight: 'bold'
	left: 230

separator1 = new root.GenericSeparatorView(140).view
separator2 = new root.GenericSeparatorView(319).view

root.bookingView.add(root.confirmTable)
root.bookingView.add(separator1)
root.bookingView.add(separator2)

confirmButton = new root.GenericPayButton('89%',L('confirm')).label
#confirmButton = new root.GenericButton(280,L('confirm')).button

root.confirmAlert = Ti.UI.createAlertDialog({title:L('confirm'),message:L('bookPaid'),cancel:1,buttonNames: ['Confirm', 'Cancel']})
root.confirmAlert.addEventListener 'click', (e) ->
	Ti.API.info e
	if e.index is 1 
		Ti.API.info 'El usuario ha cancelado'
	else
		root.doBooking()

confirmButton.addEventListener 'click', (e) ->
	validate = root.validateBookingData()
	if validate isnt true
		Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:L('reviewData') + ': ' + validate}).show()
	else
		#root.confirmAlert.show()
		if root.priceFinal < 1
			root.doBooking()
		else
			root.doZoozPayment()

nonRefundableLabel = Titanium.UI.createLabel
	borderWidth: 0
	height: Ti.UI.SIZE
	top: 340
	text: L('noRefundable')
	color: '#fff'
	textAlign: "center"
	font:
		fontSize: 12
		fontWeight: 'bold'

root.doZoozPayment = ()->
	zoozmodule = require('com.zooz.ti')
	zoozmodule.doPayment
		data:
			amount: root.priceFinal
			currencyCode: "EUR"
			appKey: "4b71ac79-9338-4cc0-91ad-220572fd54b3"
			isSandbox: false
			userEmail: root.user.email
			
		success: (data) ->
			Ti.API.info 'Result success!'
			root.doBooking()
		
		error: (data) ->
			Ti.API.info 'Callback error called.'
			Ti.UI.createAlertDialog({title: L('transaction_failed'),message: "Error Code: " + data.errorCode + " ; Error Message: " + data.errorMessage}).show()
			
		cancel: (data) ->
			Ti.API.info 'Callback cancel called.'
			Ti.UI.createAlertDialog({title: L('transaction_aborted')}).show()

root.bookingView.add(root.hotelLabel)
root.bookingView.add(root.totalLabel)
root.bookingView.add(root.priceFinalLabel)
root.bookingView.add(totalFinalLabel)
root.bookingView.add(yourCreditsLabel)
root.bookingView.add(root.priceLabel)
root.bookingView.add(root.priceCreditsLabel)
root.bookingView.add(minusLabel)
root.bookingView.add(equalsLabel)
root.bookingView.add(root.hotelAddress)
root.bookingView.add(nonRefundableLabel)
root.bookingView.add(confirmButton)
root.confirmBookingWindow.add(root.bookingView)
#root.oneClassBookingView =  new root.GenericTextView(0,L('booking'),L('booking')).view
#root.oneBookingWindow.add(root.oneClassBookingView)

root.showBookingView = () ->
	root.bookingNights = 1
	root.totalPrice = root.deal.salePriceCents
	if Titanium.App.Properties.hasProperty("user") or Titanium.Facebook.loggedIn
		root.fetchCredits()
	else
		root.showSignInView('booking')
root.confirmTable = Titanium.UI.createTableView
	backgroundColor: '#0d1e28'
	separatorColor: '#1b3c50'
	top: 80
	height: 180
	scrollable: false
	moving: false

root.openExtraNights = () ->
	if root.deal.priceDay2 > 0
		root.loadNightsView()
		root.tabGroup.activeTab.open(root.nightsWindow,{animated:true})
	else Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:"No hay noches extra disponibles para hoy"}).show()
	
root.confirmTable.addEventListener 'click', (e) ->
	if e.row.id is "nights"
		root.openExtraNights()
	else if e.row.id is "user"
		root.tabGroup.activeTab.open(root.bookingForWindow,{animated:true})
	else if e.row.id is "payment"
		root.tabGroup.activeTab.open(root.paymentWindow,{animated:true})

userRow = new root.GenericTextRow().row
userRow.rightImage = '/images/blue_arrow.png'
userRow.height = 60
userRow.id = "user"
paymentRow = new root.GenericTextRow().row
paymentRow.rightImage =  '/images/blue_arrow.png'
paymentRow.height = 60
paymentRow.id = "payment"
root.nightsRow = new root.GenericTextRow().row
root.nightsRow.rightImage =  '/images/blue_arrow.png'
root.nightsRow.height = 60
root.nightsRow.id = "nights"

checkinTitleLabel = Titanium.UI.createLabel
	width: Ti.UI.FILL
	text: L('checkin') + ':' 
	color: '#fff'
	font:
		fontSize: 14
		fontWeight: 'bold'
	left: 10
	height: 20
	top: 10

checkoutTitleLabel = Titanium.UI.createLabel
	width: Ti.UI.FILL
	text: L('checkout') + ':'
	color: '#fff'
	font:
		fontSize: 14
		fontWeight: 'bold'
	left: 10
	height: 20
	top: 32

root.checkinLabel = Titanium.UI.createLabel
	width: Ti.UI.FILL
	color: '#868d92'
	font:
		fontSize: 14
	left: 90
	top: 10
	height: 20

root.checkoutLabel = Titanium.UI.createLabel
	width: Ti.UI.FILL
	color: '#868d92'
	font:
		fontSize: 14
	left: 90
	top: 32
	height: 20

bookingForTitleLabel = Titanium.UI.createLabel
	text: L('bookingFor')+':'
	color: '#fff'
	font:
		fontSize: 14
		fontWeight: 'bold'
	left: 10
	height: 20
	top:10

root.bookingForNameLabel = Titanium.UI.createLabel
	color: '#868d92'
	width: Ti.UI.FILL
	font:
		fontSize: 14
	left: 110
	height: 20
	top: 10

root.bookingForEmailLabel = Titanium.UI.createLabel
	color: '#868d92'
	width: Ti.UI.FILL
	font:
		fontSize: 14
	left: 10
	top: 32
	height: 20

root.paymentLabel = Titanium.UI.createLabel
	width: Ti.UI.FILL
	text: L('noPaymentInfo')
	color: '#fff'
	font:
		fontSize: 14
		fontWeight: 'bold'
	left: 10
	height: 20

root.nightsRow.add(checkinTitleLabel)
root.nightsRow.add(checkoutTitleLabel)
root.nightsRow.add(root.checkinLabel)
root.nightsRow.add(root.checkoutLabel)
userRow.add(bookingForTitleLabel)
userRow.add(root.bookingForNameLabel)
userRow.add(root.bookingForEmailLabel)
paymentRow.add(root.paymentLabel)

data = []
data.push(root.nightsRow)
data.push(userRow)
data.push(paymentRow)
root.confirmTable.setData(data)
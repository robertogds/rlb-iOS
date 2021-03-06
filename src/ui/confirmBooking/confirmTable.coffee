root.confirmTable = Titanium.UI.createTableView
	backgroundColor: '#0d1e28'
	separatorColor: '#1b3c50'
	top: 140
	height: 180
	scrollable: false
	moving: false

root.openExtraNights = () ->
	Ti.API.info "********* Llama a extra night con " + root.deal.priceDay2
	if root.deal.priceDay2 > 0
		root.loadNightsView()
		root.tabGroup.tabs[root.dealsTab.pos].open(root.nightsWindow,{animated:true})
	else Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:"No hay noches extra disponibles para hoy"}).show()
	
root.confirmTable.addEventListener 'click', (e) ->
	if e.row.id is "nights"
		root.openExtraNights()
	else if e.row.id is "user"
		root.tabGroup.tabs[root.dealsTab.pos].open(root.bookingForWindow,{animated:true})
	#else if e.row.id is "payment"
	#	root.tabGroup.tabs[root.dealsTab.pos].open(root.paymentWindow,{animated:true})

userRow = new root.GenericTextRow().row
userRow.rightImage = '/images/blue_arrow.png'
userRow.height = 60
userRow.id = "user"

root.nightsRow = new root.GenericTextRow().row
root.nightsRow.rightImage =  '/images/blue_arrow.png'
root.nightsRow.height = 120
root.nightsRow.id = "nights"


checkinTitleLabel = new root.GenericSubtitleLabel(20,10,L('checkin') + ':').label
checkoutTitleLabel = new root.GenericSubtitleLabel(42,10,L('checkout') + ':').label
roomTypeTitleLabel = new root.GenericSubtitleLabel(64,10,L('room')+': ').label
regimenTitleLabel = new root.GenericSubtitleLabel(86,10,L('regime') + ': ').label


root.checkinLabel = new root.GenericTextLabel(20,90,'').label
root.checkoutLabel = new root.GenericTextLabel(42,90,'').label
root.roomTypeLabel = new root.GenericTextLabel(64,90,L('doubleRoom')).label
root.regimenLabel = new root.GenericTextLabel(86,90,'').label


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
root.nightsRow.add(roomTypeTitleLabel)
root.nightsRow.add(regimenTitleLabel)
root.nightsRow.add(root.checkinLabel)
root.nightsRow.add(root.checkoutLabel)
root.nightsRow.add(root.roomTypeLabel)
root.nightsRow.add(root.regimenLabel)
userRow.add(bookingForTitleLabel)
userRow.add(root.bookingForNameLabel)
userRow.add(root.bookingForEmailLabel)
#paymentRow.add(root.paymentLabel)

data = []
data.push(root.nightsRow)
data.push(userRow)
#data.push(paymentRow)
root.confirmTable.setData(data)
Ti.include('/js/BookingsRow.js')
Ti.include('/js/fetchBookings.js')

root.footerView = Titanium.UI.createView
	backgroundColor:'transparent' 
	borderWidth: 0
	height:100
	width:'100%'

root.bookingsTable = Titanium.UI.createTableView
	data: []
	backgroundColor: 'transparent'
	separatorColor: '#1b3c50'

root.bookingsWindow.add(root.bookingsTable)


root.bookingsTable.addEventListener 'click', (e) ->
	root.showOneBookingView(e.row.booking)
	root.tabGroup.activeTab.open(root.oneBookingWindow,{animated:true})

root.populateBookingsTable = (bookings) ->
	data = []
	for booking in bookings
		bookingRow = new root.BookingsRow(booking)
		bookingLabel = Titanium.UI.createLabel
			text: booking.checkinDate + '   '  + booking.hotelName +  '    ' + booking.salePriceCents + '€' 
			color: '#fff'
			font:
				fontSize: 12
				fontWeight: 'bold'
			left: 10
			height: 40
		bookingRow.row.add(bookingLabel)
		data.push(bookingRow.row)
	if data.length is 0
		root.noBookingsView.show()
	else
		root.bookingsTable.setData(data)
	root.bookingsTable.footerView = root.footerView
	root.hideLoading(root.bookingsWindow)
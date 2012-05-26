Ti.include(
	'/js/BookingsRow.js'
	'/js/fetchBookings.js'
)

root.bookingsTable = Titanium.UI.createTableView
	data: []
	backgroundColor: 'transparent'
	separatorColor: '#1b3c50'

root.bookingsWindow.add(root.bookingsTable)


root.bookingsTable.addEventListener 'click', (e) ->
	root.showOneBookingView(e.row.booking)
	root.tabGroup.tabs[root.bookingsTab.pos].open(root.oneBookingWindow,{animated:true})

root.populateBookingsTable = (bookings) ->
	data = []
	if bookings.length is undefined or bookings.length < 1
		root.noBookingsView.show()
	else
		for booking in bookings
			bookingRow = new root.BookingsRow(booking)
			bookingLabel = Titanium.UI.createLabel
				text: booking.checkinDate + '   '  + booking.hotelName +  '    ' + booking.salePriceCents + '€' 
				color: '#fff'
				font:
					fontSize: 12
					fontWeight: 'bold'
				left: 10
				height: 50
			bookingRow.row.add(bookingLabel)
			data.push(bookingRow.row)
		root.bookingsTable.setData(data)
	root.bookingsTable.footerView = root.footerView
	root.hideLoading(root.bookingsWindow)
Ti.include('/js/BookingsRow.js')

root.footerView = Titanium.UI.createView
    backgroundColor:'transparent' 
    borderWidth: 0
    height:100
    width:320

root.bookingsTable = Titanium.UI.createTableView
  data: []
  backgroundColor: 'transparent'
  separatorColor: '#1b3c50'

root.bookingsWindow.add(root.bookingsTable)


root.bookingsTable.addEventListener 'click', (e) ->
  root.showOneBookingView(e.row.booking)
  root.tabGroup.activeTab.open(root.oneBookingWindow,{animated:true})

# This will handle the JSON
root.xhrBookings = Titanium.Network.createHTTPClient()

root.xhrBookings.onload = () ->
  root.bookingsWindow.remove(root.errorView)
  bookings = JSON.parse(this.responseText)
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
    bookingRow.row.add(bookingLabel)
    data.push(bookingRow.row)
  if data.length is 0
    root.noBookingsView.show()
  else
    root.bookingsTable.setData(data)
    root.bookingsTable.footerView = root.footerView
  root.hideLoading(root.bookingsWindow)

root.xhrBookings.onerror = () ->
  Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:L('errorHappened')}).show()
  root.hideLoading(root.bookingsWindow)
  root.showError(root.bookingsWindow)

root.xhrBookings.timedout = () ->
  Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:L('errorHappened')}).show()

root.showBookings = () ->
  root.noBookingsView.hide()
  root.showLoading(root.bookingsWindow)
  url = root.urlSignature('/user/'+root.user.id+'/bookings')
  signature = root.doSignature(url)
  url = url + '/' + signature
  root.xhrBookings.open('GET',root.url+url)
  root.xhrBookings.setRequestHeader("Accept-Language",Titanium.Locale.currentLanguage)
  root.xhrBookings.send()
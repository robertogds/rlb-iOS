Ti.include('js/BookingsRow.js')

root.bookingsTable = Titanium.UI.createTableView
  data: []
  backgroundColor: '#0b222e'
  separatorColor: '#0b222e'

root.bookingsWindow.add(root.bookingsTable)

root.bookingsTable.addEventListener 'click', (e) ->
  root.showBookingsView(e.row.booking)
  root.tabGroup.activeTab.open(root.oneBookingWindow,{animated:true})

# This will handle the JSON
root.xhrBookings = Titanium.Network.createHTTPClient()

root.xhrBookings.onload = () ->
  bookings = JSON.parse(this.responseText)
  alert bookings
  data = []
  for booking in bookings
    Ti.API.info booking
    bookingRow = new root.BookingsRow(booking)
    data.push(bookingRow.row)
  root.bookingsTable.setData(data)
  root.bookingsWindow.remove(root.loadingView)

root.xhrBookings.onerror = () ->
  alert 'Se produjo un error. Intentelo más tarde'

root.xhrBookings.timedOut = () ->
  alert 'Se produjo un timeout. Intentelo más tarde'

root.showBookings = () ->
  alert 'Entra en shoBookings'
  root.noBookingsView.hide()
  root.bookingsWindow.add(root.loadingView)
  root.xhrBookings.open('GET', 'http://rlb-back.appspot.com/user/'+root.user.id+'/bookings')
  root.xhrBookings.send()
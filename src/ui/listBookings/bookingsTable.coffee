Ti.include('/js/BookingsRow.js')

root.bookingsTable = Titanium.UI.createTableView
  data: []
  backgroundColor: '#0b222e'
  separatorColor: '#0b222e'

root.bookingsWindow.add(root.bookingsTable)

root.bookingsTable.addEventListener 'click', (e) ->
  root.showOneBookingView(e.row.booking)
  root.tabGroup.activeTab.open(root.oneBookingWindow,{animated:true})

# This will handle the JSON
root.xhrBookings = Titanium.Network.createHTTPClient()

root.xhrBookings.onload = () ->
  Ti.API.info 'Entra en onLoad'
  bookings = JSON.parse(this.responseText)
  data = []
  for booking in bookings
    bookingRow = new root.BookingsRow(booking)
    data.push(bookingRow.row)
  if data.length is 0
    root.noBookingsView.show()
  else
    root.bookingsTable.setData(data)
  root.bookingsWindow.remove(root.loadingView)

root.xhrBookings.onerror = () ->
  alert 'Se produjo un error. Intentelo más tarde'
  root.bookingsWindow.remove(root.loadingView)
  root.showError()

root.xhrBookings.timedOut = () ->
  alert 'Se produjo un timeout. Intentelo más tarde'

root.showBookings = () ->
  root.noBookingsView.hide()
  root.bookingsWindow.add(root.loadingView)
  root.xhrBookings.open('GET',root.url+'/user/'+root.user.id+'/bookings')
  root.xhrBookings.send()
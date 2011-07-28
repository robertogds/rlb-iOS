Ti.include(
  '/js/bookingsTable.js'
  '/js/noBookingsView.js'
)

root.bookingsWindow.addEventListener 'focus', (e) ->
  if Titanium.App.Properties.hasProperty("user") or Titanium.Facebook.loggedIn
    root.showBookings()
  else
    root.noBookingsView.show()
  1
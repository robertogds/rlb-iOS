Ti.include(
  'js/bookingsTable.js'
  'js/noBookingsView.js'
)

root.bookingsWindow.addEventListener 'focus', (e) ->
  if Titanium.App.Properties.hasProperty("user")
    root.showBookings()
  else
    root.noBookingsView.show()
  1
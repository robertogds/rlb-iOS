Ti.include(
	'/js/bookingsTable.js'
	'/js/noBookingsView.js'
	'/js/bookingsPullRefresh.js'
)


root.bookingsWindow.addEventListener 'focus', (e) ->
	if Titanium.App.Properties.hasProperty("user") or Titanium.Facebook.loggedIn
		root.showBookings()
	else
		root.noBookingsView.show()
	1



#root.bookingsTab.addEventListener 'click', (e) ->



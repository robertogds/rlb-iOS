root.xhrBookings = Titanium.Network.createHTTPClient(timeout:15000)

root.xhrBookings.onload = () ->
	root.bookingsWindow.remove(root.errorView)
	root.bookingsLastUpdate = new Date()
	root.bookings = JSON.parse(this.responseText)
	root.populateBookingsTable(root.bookings)

root.xhrBookings.onerror = () ->
	Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:L('errorHappened')}).show()
	root.hideLoading(root.bookingsWindow)
	root.showError(root.bookingsWindow)

root.xhrBookings.timedout = () ->
	Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:L('errorHappened')}).show()

root.fetchBookingsConnect = () ->
	Ti.API.info 'FetchBookins es necesario actualizar'
	root.noBookingsView.hide()
	root.showLoading(root.bookingsWindow)
	url = root.urlSignature('/user/'+root.user.id+'/bookings')
	signature = root.doSignature(url)
	url = url + '/' + signature
	root.xhrBookings.open('GET',root.url+url)
	root.xhrBookings.setRequestHeader("Accept-Language",Titanium.Locale.currentLanguage)
	root.xhrBookings.send()

root.showBookings = () ->
	Ti.API.info 'Entra en showBookings'
	now = new Date()
	diffTime = now.getTime() - root.bookingsLastUpdate.getTime() 
	Ti.API.info 'FetchBookings -- La diferencia es ' + diffTime
	if root.bookings is undefined or diffTime > 100000
		root.fetchBookingsConnect()
	else
		Ti.API.info 'FetchBookins NO es necesario actualizar'
		root.populateBookingsTable(root.bookings)
# This will handle the JSON
root.xhrCredits = Titanium.Network.createHTTPClient(timeout:15000)

root.xhrCredits.onload = () ->
	Ti.API.info 'Entra en load credits OK'
	root.creditsLastUpdate = new Date()
	root.listCreditsWindow.remove(root.errorView)
	Ti.API.info this.responseText
	root.credits = JSON.parse(this.responseText)
	root.populateCreditsTable(root.credits)

root.xhrCredits.onerror = () ->
	Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:L('errorHappened')}).show()
	root.hideLoading(root.listCreditsWindow)
	root.showError(root.listCreditsWindow)

root.xhrCredits.timedout = () ->
	Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:L('errorHappened')}).show()
	
root.showCredits = () ->
	Ti.API.info 'Entra en showCredits'
	now = new Date()
	diffTime = now.getTime() - root.creditsLastUpdate.getTime() 
	Ti.API.info 'FetchCreditsTable -- La diferencia es ' + diffTime
	if root.credits is undefined or diffTime > 100000
		root.showLoading(root.listCreditsWindow)
		url = root.urlSignature('/user/'+root.user.id+'/coupons')
		signature = root.doSignature(url)
		url = url + '/' + signature
		root.xhrCredits.open('GET',root.url+url)
		root.xhrCredits.setRequestHeader("Accept-Language",Titanium.Locale.currentLanguage)
		root.xhrCredits.send()
	else
		Ti.API.info 'FetchCreditsTable NO es necesario actualizar'
		root.populateCreditsTable(root.bookings)
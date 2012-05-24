root.xhrLoadCredits = Titanium.Network.createHTTPClient()
root.xhrLoadCredits.setTimeout(15000)

root.xhrLoadCredits.onload = () ->
	Ti.API.info 'Entra en load credits OK'
	root.creditsLastUpdate = new Date()
	Ti.API.info this.responseText
	root.credits = JSON.parse(this.responseText)
	root.totalCredit = 0
	for credit in root.credits
		root.totalCredit = root.totalCredit + credit.credits
	root.balanceLabel.text = root.totalCredit + '€'
	if root.totalCredit is 0
		root.creditsTab.badge = undefined
	else
		root.creditsTab.badge = root.totalCredit
	if root.tabGroup.activeTab.id is 'deals'
		root.showConfirmBooking()
	root.hideLoading(root.creditsWindow)

root.xhrLoadCredits.onerror = () ->
	Ti.API.info 'Entra en load Credits ERROR'
	Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:L('errorHappened')}).show()
	root.hideLoading(root.creditsWindow)

root.xhrLoadCredits.timedout = () ->
	Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:L('errorHappened')}).show()
	root.hideLoading(root.creditsWindow)

root.fetchCredits = () ->
	Ti.API.info 'Entra en fetchCredits'
	now = new Date()
	if root.creditsLastUpdate is undefined
		root.creditsLastUpdate = new Date()
	diffTime = now.getTime() - root.creditsLastUpdate.getTime() 
	Ti.API.info 'FetchCredits -- La diferencia es ' + diffTime
	if root.credits is undefined or diffTime > 10000 
		Ti.API.info 'Es necesario actualizar'
		url = root.urlSignature('/user/'+root.user.id+'/coupons')
		signature = root.doSignature(url)
		url = url + '/' + signature
		root.xhrLoadCredits.open('GET',root.url+url)
		root.xhrLoadCredits.setRequestHeader("Accept-Language",Titanium.Locale.currentLanguage)
		root.xhrLoadCredits.send()
	else
		Ti.API.info 'ListCredits: No es necesario actualizar'
		if root.tabGroup.activeTab.id is 'deals'
			root.showConfirmBooking()
		root.hideLoading(root.creditsWindow)
root.xhrLoadCredits = Titanium.Network.createHTTPClient()
root.xhrLoadCredits.setTimeout(15000)

root.xhrLoadCredits.onload = () ->
	Ti.API.info 'Entra en load credits OK'
	Ti.API.info this.responseText
	root.credits = JSON.parse(this.responseText)
	root.totalCredit = 0
	for credit in root.credits
		root.totalCredit = root.totalCredit + credit.credits
	root.balanceLabel.text = root.totalCredit + '€'
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
	url = root.urlSignature('/user/'+root.user.id+'/coupons')
	signature = root.doSignature(url)
	url = url + '/' + signature
	root.xhrLoadCredits.open('GET',root.url+url)
	root.xhrLoadCredits.setRequestHeader("Accept-Language",Titanium.Locale.currentLanguage)
	root.xhrLoadCredits.send()
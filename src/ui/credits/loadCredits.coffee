root.xhrLoadCredits = Titanium.Network.createHTTPClient(timeout: 15000)

root.xhrLoadCredits.onload = () ->
	Ti.API.info 'Entra en load credits OK'
	root.listCreditsWindow.remove(root.errorView)
	Ti.API.info this.responseText
	credits = JSON.parse(this.responseText)
	data = []
	for credit in credits
		creditRow = new root.CreditsRow(credit)
		data.push(creditRow.row)
	if data.length is 0
		root.noCreditsView.show()
	else
		root.creditsTable.setData(data)
	root.creditsTable.footerView = root.footerView
	root.hideLoading(root.listCreditsWindow)

root.xhrLoadCredits.onerror = () ->
	Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:L('errorHappened')}).show()
	root.hideLoading(root.listCreditsWindow)
	root.showError(root.listCreditsWindow)

root.xhrLoadCredits.timedout = () ->
	Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:L('errorHappened')}).show()

root.showCredits = () ->
	Ti.API.info 'Entra en showCredits'
	root.noCreditsView.hide()
	root.showLoading(root.listCreditsWindow)
	url = root.urlSignature('/user/'+root.user.id+'/coupons')
	signature = root.doSignature(url)
	url = url + '/' + signature
	root.xhrLoadCredits.open('GET',root.url+url)
	root.xhrLoadCredits.setRequestHeader("Accept-Language",Titanium.Locale.currentLanguage)
	root.xhrLoadCredits.send()
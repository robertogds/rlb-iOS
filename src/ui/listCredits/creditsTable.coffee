Ti.include('/js/CreditsRow.js')

root.footerView = Titanium.UI.createView
	backgroundColor:'transparent' 
	borderWidth: 0
	height:100
	width:Ti.UI.FILL

root.creditsTable = Titanium.UI.createTableView
	data: []
	backgroundColor: 'transparent'
	separatorColor: '#1b3c50'

root.listCreditsWindow.add(root.creditsTable)

# This will handle the JSON
root.xhrCredits = Titanium.Network.createHTTPClient()
root.xhrCredits.setTimeout(15000)

root.xhrCredits.onload = () ->
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

root.xhrCredits.onerror = () ->
	Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:L('errorHappened')}).show()
	root.hideLoading(root.listCreditsWindow)
	root.showError(root.listCreditsWindow)

root.xhrCredits.timedout = () ->
	Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:L('errorHappened')}).show()

root.showCredits = () ->
	Ti.API.info 'Entra en showCredits'
	root.noCreditsView.hide()
	root.showLoading(root.listCreditsWindow)
	url = root.urlSignature('/user/'+root.user.id+'/coupons')
	signature = root.doSignature(url)
	url = url + '/' + signature
	root.xhrCredits.open('GET',root.url+url)
	root.xhrCredits.setRequestHeader("Accept-Language",Titanium.Locale.currentLanguage)
	root.xhrCredits.send()
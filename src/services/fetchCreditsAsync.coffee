root.xhrFetchCredits = Titanium.Network.createHTTPClient(timeout: 15000)

root.xhrFetchCredits.onload = () ->
	Ti.API.info 'fetchCreditsAsync OK'
	root.creditsLastUpdate = new Date()
	Ti.API.info 'Entra en load credits OK'
	Ti.API.info this.responseText
	root.credits = JSON.parse(this.responseText)
	root.totalCredit = 0
	for credit in root.credits
		root.totalCredit = root.totalCredit + credit.credits
	Ti.API.info '***** El valor total de los créditos es: ' + root.totalCredit
	root.balanceLabel.text = root.totalCredit + '€'
	if root.totalCredit is 0
		root.creditsTab.badge = undefined
	else
		root.creditsTab.badge = root.totalCredit
	root.hideLoading(root.creditsWindow)

root.xhrFetchCredits.onerror = () ->
	Ti.API.info 'Entra en load Credits ERROR'

root.fetchCreditsAsync = () ->
	Ti.API.info 'Entra en fetchCreditsAsync'
	url = root.urlSignature('/user/'+root.user.id+'/coupons')
	signature = root.doSignature(url)
	url = url + '/' + signature
	root.xhrFetchCredits.open('GET',root.url+url)
	root.xhrFetchCredits.setRequestHeader("Accept-Language",Titanium.Locale.currentLanguage)
	root.xhrFetchCredits.send()
	Ti.API.info 'Sale de fetchCreditsAsync'
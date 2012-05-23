root.xhrLogin = Titanium.Network.createHTTPClient()

root.xhrLogin.onload = (e) ->
	try
		login = JSON.parse(this.responseText)
	catch error
		Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:L('errorHappened') + '\n' + error}).show()
	if login.status is 200
		Ti.API.info 'Paso 1'
		root.user = login.content
		Ti.API.info 'Paso 3'
		#root.user.refererId = undefined
		Titanium.App.Properties.setString("user",JSON.stringify(root.user))
		Ti.API.info 'Paso 4'
		root.loadAccountLabels()
		root.signInWindow.close() 
		if root.tabGroup.activeTab.id is 'deals'
			root.fetchCredits()
		else
			root.fetchCreditsAsync()
	else
		Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:'Error: ' + login.detail}).show()
	root.hideLoading(root.signInView)


root.xhrLogin.onerror = (e) ->
	root.showError(root.accountWindow)
	Ti.API.error(e)

root.doLogin = (email,password) ->
	Ti.API.info '*** Entra en doLogin'
	root.xhrLogin.setTimeout(15000)
	root.xhrLogin.open("POST",root.surl+"/users/login")
	root.xhrLogin.setRequestHeader("Content-Type","application/json; charset=utf-8")
	root.xhrLogin.setRequestHeader("Accept-Language",Titanium.Locale.currentLanguage)
	root.xhrLogin.send(JSON.stringify({"email":email, "password":password}))

root.validateLoginData = (email,password) ->
	return Ti.Locale.getString('errorEmail') unless email.length > 3
	return Ti.Locale.getString('errorPassword') unless password.length > 3
	return true

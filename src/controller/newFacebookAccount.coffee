root.xhrFacebookRegister = Titanium.Network.createHTTPClient()

root.xhrFacebookRegister.onload = (e) ->
	Ti.API.info 'Entra en FacebookRegistre onLoad ok'
	Ti.API.info this.responseText
	response = JSON.parse(this.responseText)
	Ti.API.info response
	if response.status is 200
		Ti.API.info 'Entra en status 200'
		root.user = response.content
		root.facebookUser.rlbId = root.user.id
		root.facebookUser.rlbToken = root.user.token
		root.facebookUser.rlbSecret = root.user.secret
		root.facebookUser.rlbPassword = root.user.password
		Ti.API.info response.content
		root.hideLoading(root.newAccountWindow)
		root.hideLoading(root.signInWindow)
		root.newAccountWindow.close()
		root.signInWindow.close()
		if root.tabGroup.activeTab.id is 'deals'
			root.showConfirmBooking()
		
		
	else
		Ti.API.error response.content
		Ti.UI.createAlertDialog({title:'ReallyLateBooking',message: L('errorHappened')}).show()
	Ti.API.info '*** Registra el usuario de facebook'
	Titanium.App.Properties.setString("facebookUser",JSON.stringify(root.facebookUser))
	
root.xhrFacebookRegister.onerror = (e) ->
	Ti.API.info 'Ha entrado en facebook register ERROR'
	root.showError(root.accountWindow)
	Ti.API.error(e)


root.doFacebookRegister = (email,firstName,lastName) ->
	Ti.API.info 'Entra en doFacebookRegister'
	password = Titanium.Utils.md5HexDigest("facebookUser")
	url = root.url + "/users"
	proto = 'POST'  
	root.xhrFacebookRegister.open(proto,url)
	root.xhrFacebookRegister.setRequestHeader("Content-Type","application/json; charset=utf-8")
	root.xhrFacebookRegister.setRequestHeader("Accept-Language",Titanium.Locale.currentLanguage)
	newUser = JSON.stringify
		"email":email
		"password":password
		"firstName":firstName
		"lastName":lastName
		"isFacebook":"true"
	Ti.API.info newUser
	root.xhrFacebookRegister.send(newUser)
root.xhrRegister = Titanium.Network.createHTTPClient()

root.xhrRegister.onload = (e) ->
	root.hideLoading(root.newAccountWindow)
	response = JSON.parse(this.responseText)
	if response.status is 200
		root.user = response.content
		Titanium.App.Properties.setString("user",JSON.stringify(root.user))
		root.loadAccountLabels()
		root.newAccountWindow.close()
		root.editAccountWindow.close()		
	else
		Ti.API.error response.detail
		Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:'Error: ' + response.detail}).show()

root.xhrRegister.onerror = (e) ->
	root.hideLoading(root.newAccountWindow)
	root.showError()
	Ti.API.error(e)

root.doRegister = (email,password,firstName,lastName,id) ->
	root.xhrRegister.setTimeout(8000)
	if id > 0
		url = root.urlSignature("/user/" + id)
		signature = root.doSignature(url)
		url = root.surl + url + '/' + signature
		proto = 'PUT'
	else
		password = Titanium.Utils.md5HexDigest(password)
		url = root.url + "/users"
		proto = 'POST'  
	root.xhrRegister.open(proto,url)
	root.xhrRegister.setRequestHeader("Content-Type","application/json; charset=utf-8")
	root.xhrRegister.setRequestHeader("Accept-Language",Titanium.Locale.currentLanguage)
	newUser = JSON.stringify
		"email":email
		"password":password
		"firstName":firstName
		"lastName":lastName
		"isFacebook":"false"
	root.xhrRegister.send(newUser)
	Ti.API.info 'LLeta hasta el final'

root.validateNewAccountData = (email,password,firstName,lastName,repeatPass) ->
	return Ti.Locale.getString('passDoNotMatch') unless password is repeatPass
	return Ti.Locale.getString('errorEmail') unless email.length > 3
	return Ti.Locale.getString('errorEmail') unless /\@/.test(email)
	return Ti.Locale.getString('errorPassword') unless password.length > 3
	return Ti.Locale.getString('errorFirstName') unless firstName.length > 0
	return Ti.Locale.getString('errorLastName') unless lastName.length > 0
	return true
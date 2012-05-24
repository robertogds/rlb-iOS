root.xhrFetchUser = Titanium.Network.createHTTPClient(timeout:9000)

root.xhrFetchUser.onload = (e) ->
	root.hideLoading(root.newAccountWindow)
	Ti.API.info 'USER: ' + this.responseText
	response = JSON.parse(this.responseText)
	if response.status is 200
		Ti.API.info '*********** ENTRA EN FETCH USER CON REFERERID = ' + response.refererId
		root.user = response.content
		Titanium.App.Properties.setString("user",JSON.stringify(root.user))

root.xhrFetchUser.onerror = (e) ->
	Ti.API.info 'Entra en error fetchUser'
	Ti.API.error(e)

root.fetchServerUser = () ->
	url = root.urlSignature("/user/" + root.user.id)
	signature = root.doSignature(url)
	url = root.surl + url + '/' + signature
	proto = 'GET'
	root.xhrFetchUser.open(proto,url)
	root.xhrFetchUser.setRequestHeader("Content-Type","application/json; charset=utf-8")
	root.xhrFetchUser.setRequestHeader("Accept-Language",Titanium.Locale.currentLanguage)
	root.xhrFetchUser.send()
	Ti.API.info 'LLeta hasta el final'

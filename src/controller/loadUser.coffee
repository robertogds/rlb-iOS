root.loadUser = () ->
	if Titanium.App.Properties.hasProperty("user")
		Ti.API.info 'Tiene user'
		root.user = JSON.parse(Titanium.App.Properties.getString("user"))
		root.loginView.hide()
		root.loggedView.show()
		root.loadLoggedUser()
	else if Titanium.Facebook.loggedIn
		Ti.API.info 'Esta logado con facebook'
		if Titanium.App.Properties.hasProperty("facebookUser")
			root.facebookUser = JSON.parse(Titanium.App.Properties.getString("facebookUser"))
			root.user = root.facebookUser
			root.user.id = root.facebookUser.rlbId
			root.user.token = root.facebookUser.rlbToken 
			root.user.secret = root.facebookUser.rlbSecret
			root.user.password = root.facebookUser.rlbPassword
			root.user.firstName = root.facebookUser.first_name
			root.user.lastName =  root.facebookUser.last_name
			root.loginView.hide()
			root.loggedView.show()
			root.loadLoggedFacebookUser()
		else
			Ti.API.info 'Esta logado con facebook pero no tenemos datos, hacemos logout'
			Titanium.Facebook.logout()
	else
		Ti.API.info 'No tiene ni user ni esta logado con facebook, borramos todo'
		Titanium.App.Properties.removeProperty("user")
		Titanium.App.Properties.removeProperty("facebookUser")
		
root.urlSignature = (url) ->
	timestamp = new Date().getTime()
	token = root.user.token
	return url + '/' + token + '/' + timestamp

root.doSignature = (url) ->
	secret = root.user.secret
	return Titanium.Utils.md5HexDigest(url+secret)

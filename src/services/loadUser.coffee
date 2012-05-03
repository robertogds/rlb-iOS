root.loadUser = () ->
	Ti.API.info 'Entra en loadUser'
	if Titanium.App.Properties.hasProperty("user")
		Ti.API.info 'Tiene user'
		root.user = JSON.parse(Titanium.App.Properties.getString("user"))
	else if Titanium.Facebook.loggedIn
		Ti.API.info 'Esta logado con facebook'
		if Titanium.App.Properties.hasProperty("facebookUser")
			root.facebookUser = JSON.parse(Titanium.App.Properties.getString("facebookUser"))
			Ti.API.info 'FACEBOOK EMAIL = ' + root.facebookUser.email
			root.user = root.facebookUser
			Ti.API.info 'USEREMAIL = ' + root.user.email
			root.user.id = root.facebookUser.rlbId
			root.user.token = root.facebookUser.rlbToken 
			root.user.secret = root.facebookUser.rlbSecret
			root.user.password = root.facebookUser.rlbPassword
			root.user.firstName = root.facebookUser.first_name
			root.user.lastName =  root.facebookUser.last_name
			
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
	
root.isLogged = (e) ->
	Ti.API.info 'Entra en isLogged'
	if Titanium.App.Properties.hasProperty("user")
		Ti.API.info 'isLogged TRUE'
		return true		
	else if Titanium.App.Properties.hasProperty("facebookUser")
		Ti.API.info 'isLogged TRUE - FACEBOOK'
		return true
	else
	 	Ti.API.info 'isLogged FALSE'
		return false

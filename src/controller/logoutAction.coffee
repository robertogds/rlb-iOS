root.doLogout = () ->
	Ti.API.info 'Entra root.doLogout'
	if Titanium.Facebook.loggedIn
		Ti.Facebook.logout
	root.user = null 
	Titanium.App.Properties.removeProperty("user")
	Titanium.App.Properties.removeProperty("facebookUser")
	root.loadUser()
	Ti.API.info 'llama a loadAccountLabels'
	root.loadAccountLabels()

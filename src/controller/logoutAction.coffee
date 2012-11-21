root.confirmLogout = Ti.UI.createAlertDialog({title:L('confirm'),message:L('sure_logout'),cancel:1,buttonNames: [L('confirm'), L('cancel')]})
root.confirmLogout.addEventListener 'click', (e) ->
	Ti.API.info e
	if e.index is 1 
		Ti.API.info 'El usuario ha cancelado'
	else
		root.doLogout()

root.doLogout = () ->
	Ti.API.info 'Entra root.doLogout'
	if Titanium.Facebook.loggedIn
		Ti.Facebook.logout
	root.sharekit.logoutFromAll()
	root.user = null 
	Titanium.App.Properties.removeProperty("user")
	Titanium.App.Properties.removeProperty("facebookUser")
	root.loadUser()
	Ti.API.info 'llama a loadAccountLabels'
	root.creditsTab.badge = '+5'
	root.loadAccountLabels()

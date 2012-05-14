Ti.include( 
  '/js/loginTable.js'
)

root.signInView = Titanium.UI.createView
	background: "transparent"
	top: 0
	text: "sign in"
	

loginLabel = Titanium.UI.createLabel
	text: L('orLoginLabel')+':'
	textAlign: 'center'
	color: '#fff'
	font:
		fontSize: 14
		fontWeight: 'bold'
	height: 30
	top: 65

signInButton = new root.GenericButton(210,Ti.Locale.getString('signIn')).button

signInButton.addEventListener 'click', (e) ->
	email = root.emailText.value
	password = root.passText.value
	validate = root.validateLoginData(email,password)
	if validate is true
		password = Titanium.Utils.md5HexDigest(password)
		root.showLoading(root.signInView)
		root.doLogin(email,password)
	else
		Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:L('reviewData') + validate}).show()

root.rememberPassView = new root.Generic2RowsView(270,L('IForgotPassword'),L('needAccount'))
root.rememberPassView.table.height = 44

root.rememberPassView.label1.addEventListener 'click', (e) ->
	root.tabGroup.activeTab.open(root.rememberPassWindow,{animated:true})

root.rememberPassView.label2.addEventListener 'click', (e) ->
	Ti.API.info 'Entra en create new account'
	root.signInWindow.close()
	Ti.API.info 'llama a showNewAccount'
	root.showNewAccount()
	Ti.API.info 'Fin click'

root.showSignInView = (source) ->
	if source is 'booking'
		root.rememberPassView.table.height = 88
	else
		root.rememberPassView.table.height = 44
	root.tabGroup.activeTab.open(root.signInWindow,{animated:true})

root.signInView.add(root.facebookLoginButton)
root.signInView.add(loginLabel)
root.signInView.add(root.loginTable)
root.signInView.add(signInButton)
root.signInView.add(root.rememberPassView.view)
root.signInWindow.add(root.signInView)
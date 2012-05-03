root.loadUser()

Ti.include(
	'/js/faqView.js'
	'/js/facebookButton.js'
	'/js/editAccountView.js'
	'/js/newAccountView.js'
	'/js/loginAction.js'
	'/js/logoutAction.js'
	'/js/newFacebookAccount.js'
	'/js/rememberPassView.js'
	'/js/signInView.js'
	'/js/rememberPassAction.js'
	'/js/accountView.js'
)

root.accountWindow.addEventListener 'focus', (e) ->
	Ti.API.info 'Entra en focus accountWindow'
	root.loadAccountLabels()

root.loadAccountLabels = () ->
	if root.isLogged()
		root.loginLabelView.label1.text = L('signedInAs') + ' ' + root.user.email
		root.registerLabelView.label1.text = L('logout')
	else
		root.loginLabelView.label1.text = L('loginLabel')
		root.registerLabelView.label1.text = L('needAccount')


Ti.include(
	'/js/supportView.js'
	'/js/testWindow.js'
	'/js/optionsView.js'
)

root.optionsWindow.addEventListener 'focus', (e) ->
	Ti.API.info 'Entra en focus accountWindow'
	root.loadAccountLabels()

root.loadAccountLabels = () ->
	if root.isLogged()
		root.loginLabelView.label1.text = L('signedInAs') + ' ' + root.user.email
		root.registerLabelView.label1.text = L('logout')
	else
		root.loginLabelView.label1.text = L('loginLabel')
		root.registerLabelView.label1.text = L('needAccount')
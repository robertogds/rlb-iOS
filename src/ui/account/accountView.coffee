root.accountView = Titanium.UI.createView
	backgroundColor: 'transparent'

root.loginLabelView = new root.Generic2RowsView(20,L('loginLabel'))
root.loginLabelView.table.height = 44
root.registerLabelView = new root.Generic2RowsView(80,L('needAccount'))
root.registerLabelView.table.height = 44
if root.isLogged()
	root.loginLabelView.label1.text = L('signedInAs') + ' ' + root.user.email
	root.registerLabelView.label1.text = L('logout')

	
root.loginLabelView.label1.addEventListener 'click', (e) ->
	if root.isLogged()
		root.tabGroup.activeTab.open(root.editAccountWindow,{animated:true})
		root.loadEditLoggedUser()
		root.editAccountWindow.setTitle(L('editAccount'))
	else
		root.showSignInView('account')
	

root.registerLabelView.label1.addEventListener 'click', (e) ->
	if root.isLogged()
		Ti.API.info '***** Llama a hacer logout'
		root.doLogout()
	else
		root.showNewAccount()
	

faqSupportView = new root.Generic2RowsView(150,'FAQ',L('userSupport'))

faqSupportView.label1.addEventListener 'click', (e) ->
	root.showFAQ()

faqSupportView.label2.addEventListener 'click', (e) ->
	root.tabGroup.activeTab.open(root.supportWindow,{animated:true})


root.accountView.add(root.loginLabelView.view)
root.accountView.add(root.registerLabelView.view)
root.accountView.add(faqSupportView.view)


#root.accountView.add(root.loginView)
#root.accountView.add(root.loggedView)
root.accountWindow.add(root.accountView)

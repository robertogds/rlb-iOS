root.noLoginCreditsView = Titanium.UI.createView
	backgroundImage: '/images/Texture.jpg'

logoutText = L('use_first_free_coupon')
titleText = L('10_euros_free')

noLoginCreditsView =  new root.GenericTextView(5,titleText,logoutText).view


enterMenu = new root.GenericMenuTable(300,1)
enterRow = new root.GenericRow(L('register_free'))

enterMenu.section.add(enterRow.row)

enterRow.label.addEventListener 'click', (e) ->
	root.showSignInView('booking')

root.noLoginCreditsView.add(noLoginCreditsView)
root.noLoginCreditsView.add(enterMenu.view)
root.noLoginInviteView = Titanium.UI.createView
	backgroundImage: '/images/Texture.jpg'

logoutText = 'Invita a tus amigos y les daremos 20€ de regalo para su primera reserva\n\nAdemás tu también recibirás 20€ de regalo cuando realizen su reserva.\n\nSuena bien, verdad?'
titleText = 'Invita a tus amigos y gana'

noInviteTextView =  new root.GenericTextView(5,titleText,logoutText).view


enterMenu = new root.GenericMenuTable(300,1)
enterRow = new root.GenericRow('Regístrate e invita a tus amigos')

enterMenu.section.add(enterRow.row)

enterRow.label.addEventListener 'click', (e) ->
	root.showSignInView('booking')

root.noLoginInviteView.add(noInviteTextView)
root.noLoginInviteView.add(enterMenu.view)
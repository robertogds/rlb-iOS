root.noLoginCreditsView = Titanium.UI.createView
	backgroundImage: '/images/Texture.jpg'

logoutText = 'Sólo por ser tú, usa el código RLB cuadno te hayas registrado y te regalamos 10 € para que hagas tu primera reserva.\n\nAdemás podrás conseguir más créditos invitando a tus amigos desde tu cuenta.'
titleText = '10 € Para que te animes'

noLoginCreditsView =  new root.GenericTextView(5,titleText,logoutText).view


enterMenu = new root.GenericMenuTable(300,1)
enterRow = new root.GenericRow('Regístrate gratis')

enterMenu.section.add(enterRow.row)

enterRow.label.addEventListener 'click', (e) ->
	root.showSignInView('booking')

root.noLoginCreditsView.add(noLoginCreditsView)
root.noLoginCreditsView.add(enterMenu.view)
root.noCreditsView = Titanium.UI.createView
	backgroundImage: '/images/Texture.jpg'

logoutText = 'Invita a tus amigos para conseguir créditos y úsalos en tu próxima compra'
titleText = 'Todavía no tienes créditos'

noCreditsView =  new root.GenericTextView(5,titleText,logoutText).view


enterMenu = new root.GenericMenuTable(300,1)
enterRow = new root.GenericRow('Invita a tus amigos')

enterMenu.section.add(enterRow.row)

enterRow.label.addEventListener 'click', (e) ->
	root.tabGroup.setActiveTab(2)

root.noCreditsView.add(noCreditsView)
root.noCreditsView.add(enterMenu.view)
Ti.include(
	'/js/newCouponView.js'
	'/js/balanceView.js'
)
creditsView = Titanium.UI.createView
	height: '100%'
	width: '100%'
	background: 'transparent'

root.explainCreditsView = Titanium.UI.createView
	height:300
	borderWidth:1
	boderColor: 'grey'
	top: 160
	

explainText = new root.GenericTextLabel(10,10,'✓ Créditos diponibles para tu próxima reserva.\n\n✓ Invita a tus amigos y consigue más créditos.\n\n✓ Date Prisa!, los créditos se caducan.').label
root.explainCreditsView.add(explainText)

optionsMenu = new root.GenericMenuTable(110,2)
historyRow = new root.GenericRow('Ver historial créditos')
inviteRow = new root.GenericRow('Invita a más amigos')

optionsMenu.section.add(historyRow.row)
optionsMenu.section.add(inviteRow.row)

historyRow.label.addEventListener 'click', (e) ->
	root.tabGroup.activeTab.open(root.listCreditsWindow,{animated:true})

inviteRow.label.addEventListener 'click', (e) ->
	root.tabGroup.activeTab.open(root.supportWindow,{animated:true})

root.explainCreditsView.add(optionsMenu.view)

creditsView.add(root.newCouponView)
creditsView.add(root.balanceView)
creditsView.add(root.explainCreditsView)
root.creditsWindow.add(creditsView)
root.inviteView = Titanium.UI.createView
	height: '100%'
	width: '100%'
	background: 'transparent'

inviteTitle = new root.GenericTitleLabel(10,10,'Comparte y gana!' ).label
codeText = new root.GenericTextLabel(50,10,'Usa tu código personal: ').label

root.codeLabel = new root.GenericBlueTitleLabel(70,10,'').label
explainText = new root.GenericTextLabel(110,10,'✓ Le daremos 20€ a tus amigos que se registren y canjeen tu código\n\n✓ Además te daremos 20€ cuando haga su primera reserva.').label

optionsMenu = new root.GenericMenuTable(220,3)
facebookRow = new root.GenericRow('Invite via Facebook')
twitterRow = new root.GenericRow('Invite via Twitter')
emailRow = new root.GenericRow('Invite via Email')

optionsMenu.section.add(facebookRow.row)
optionsMenu.section.add(twitterRow.row)
optionsMenu.section.add(emailRow.row)

facebookRow.label.addEventListener 'click', (e) ->
	root.sharekit.share
		title: 'ReallyLateBooking'
		text: L('shareRLBFacebook')
		sharer: 'Facebook'

twitterRow.label.addEventListener 'click', (e) ->
	root.sharekit.share
		title: 'ReallyLateBooking'
		text: L('shareRLBTwitter')
		sharer: 'Twitter'

emailRow.label.addEventListener 'click', (e) ->
	emailDialog = Titanium.UI.createEmailDialog()
	emailDialog.subject = 'Roberto te regala 20€ en RLB'
	emailDialog.messageBody = 'Hola, estoy usando RLB y quiero creo que te puede interesar, descarga la app y usa mi código...'
	emailDialog.open()

root.inviteView.add(inviteTitle)
root.inviteView.add(codeText)
root.inviteView.add(root.codeLabel)
root.inviteView.add(explainText)
root.inviteView.add(optionsMenu.view)
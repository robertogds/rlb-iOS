root.inviteView = Titanium.UI.createView
	height: '100%'
	width: '100%'
	background: 'transparent'

inviteTitle = new root.GenericTitleLabel(10,10, L('shareandwin') ).label
codeText = new root.GenericTextLabel(50,10, L('use_code')).label

root.codeLabel = new root.GenericBlueTitleLabel(70,10,'').label
explainText = new root.GenericTextLabel(110,10, L('reward_friend')).label

optionsMenu = new root.GenericMenuTable(220,3)
facebookRow = new root.GenericRow( L('invite_fb'))
twitterRow = new root.GenericRow( L('invite_twitter'))
emailRow = new root.GenericRow( L('invite_email'))

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
	emailDialog.subject = String.format(L('friend_gift'), root.user.firstName)
	emailDialog.messageBody =  L('im_using_rlb')
	emailDialog.open()

root.inviteView.add(inviteTitle)
root.inviteView.add(codeText)
root.inviteView.add(root.codeLabel)
root.inviteView.add(explainText)
root.inviteView.add(optionsMenu.view)
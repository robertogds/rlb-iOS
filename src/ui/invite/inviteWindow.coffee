Ti.include(
	'/js/noLoginInviteView.js'
	'/js/inviteView.js'
)

if root.isLogged()
	root.inviteWindow.add(root.inviteView)
else
	root.inviteWindow.add(root.noLoginInviteView)
	
root.inviteWindow.addEventListener 'focus', (e) ->
	Ti.API.info 'Invite pilla el focus'
	if root.isLogged()
		root.loadRefererId()
		root.codeLabel.text = root.user.refererId
		root.inviteWindow.remove(root.noLoginInviteView)
		root.inviteWindow.add(root.inviteView)
		root.inviteFacebookRow.label.addEventListener 'click', (e) ->
			root.sharekit.share
				title: 'ReallyLateBooking'
				text: String.format(L('invite_facebook_body'),root.user.refererId)
				sharer: 'Facebook'

		root.inviteTwitterRow.label.addEventListener 'click', (e) ->
			root.sharekit.share
				title: 'ReallyLateBooking'
				text: String.format(L('invite_twitter_body'),root.user.refererId)
				sharer: 'Twitter'

		root.inviteEmailRow.label.addEventListener 'click', (e) ->
			emailDialog = Titanium.UI.createEmailDialog()
			emailDialog.subject = String.format(L('invite_email_subject'), root.user.firstName)
			emailDialog.messageBody =  String.format(L('invite_email_body'),root.user.refererId)
			emailDialog.open()
	else
		root.inviteWindow.remove(root.inviteView)
		root.inviteWindow.add(root.noLoginInviteView)
	1
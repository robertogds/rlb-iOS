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
	else
		root.inviteWindow.remove(root.inviteView)
		root.inviteWindow.add(root.noLoginInviteView)
	1
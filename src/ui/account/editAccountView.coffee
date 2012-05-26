root.editAccountView = Titanium.UI.createView
	backgroundColor: 'transparent'

root.editAccountTable = Titanium.UI.createTableView
	top: 20
	height: 176
	width: "95%"
	borderWidth:0
	borderRadius: 10
	scrollable: false
	moving: false
	backgroundColor: '#fff'

root.firstNameText = Titanium.UI.createTextField
	width: '90%'
	height: '90%'
	backgroundColor: '#fff'
	color:'#336699'
	hintText: Ti.Locale.getString('firstName')
	clearOnEdit: true
	paddingLeft: 10
	returnKeyType: Titanium.UI.RETURNKEY_NEXT

root.firstNameText.addEventListener 'return', (e) ->
	root.lastNameText.focus()

root.lastNameText = Titanium.UI.createTextField
	width: '90%'
	height: '90%'
	backgroundColor: '#fff'
	color:'#336699'
	hintText: Ti.Locale.getString('lastName')
	clearOnEdit: true
	paddingLeft: 10
	returnKeyType: Titanium.UI.RETURNKEY_NEXT

root.lastNameText.addEventListener 'return', (e) ->
	root.passwordText.focus()

#root.emailText = Titanium.UI.createTextField
#	height: '100%'
#	backgroundColor: '#fff'
#	width: '100%'
#	color:'#336699'
#	hintText: Ti.Locale.getString('email')
#	clearOnEdit: true
#	paddingLeft: 10
#	keyboardType: Titanium.UI.KEYBOARD_EMAIL
#	returnKeyType: Titanium.UI.RETURNKEY_NEXT

#root.emailText.addEventListener 'return', (e) ->
#	root.passwordText.focus()


root.passwordText = Titanium.UI.createTextField
	width: '90%'
	height: '90%'
	backgroundColor: '#fff'
	color:'#336699'
	hintText: L('password')
	paddingLeft: 10
	clearOnEdit: true
	passwordMask:true
	returnKeyType: Titanium.UI.RETURNKEY_NEXT

root.passwordText.addEventListener 'return', (e) ->
	root.repeatPassText.focus()
	#root.submitEdit()

root.repeatPassText = Titanium.UI.createTextField
	width: '90%'
	height: '90%'
	backgroundColor: '#fff'
	color:'#336699'
	hintText: L('password')
	paddingLeft: 10
	clearOnEdit: true
	passwordMask:true

root.repeatPassText.addEventListener 'return', (e) ->
	#root.submitEdit()
	root.repeatPassText.blur()
  
root.editAccountSection = Titanium.UI.createTableViewSection()
root.editAccountData = []
firstNameRow = Titanium.UI.createTableViewRow
	width: '100%'
	height: 44
lastNameRow = Titanium.UI.createTableViewRow
	width: '100%'
	height: 44
#emailRow = Titanium.UI.createTableViewRow
#	width: '100%'
#	height: 44

passwordRow = Titanium.UI.createTableViewRow
	width: '100%'
	height: 44
repeatPassRow = Titanium.UI.createTableViewRow
	width: '100%'
	height: 44

firstNameRow.add(root.firstNameText)
lastNameRow.add(root.lastNameText)
#emailRow.add(root.emailText)
passwordRow.add(root.passwordText)
repeatPassRow.add(root.repeatPassText)

root.editAccountSection.add(firstNameRow)
root.editAccountSection.add(lastNameRow)
#root.editAccountSection.add(emailRow)
root.editAccountSection.add(passwordRow)
root.editAccountSection.add(repeatPassRow)

sendButton = new root.GenericButton(250,Ti.Locale.getString('send')).button

sendButton.addEventListener 'click', (e) ->
	root.submitEdit()

root.editAccountView.add(sendButton)
root.editAccountWindow.add(root.editAccountView)

root.loadEditLoggedUser = () ->
	root.hideLoading(root.editAccountWindow)
	root.firstNameText.value = ''
	root.lastNameText.value = ''
	root.passwordText.value = ''
	root.repeatPassText.value = ''
	root.firstNameText.hintText = L('firstName') + ': '+root.user.firstName
	root.lastNameText.hintText =  L('lastName') + ': '+root.user.lastName
	root.passwordText.hintText = L('password') + ': *******'
	root.repeatPassText.hintText = L('repeatPass') + ': *******'
	root.editAccountData[0] = root.editAccountSection
	root.editAccountTable.data = root.editAccountData
	root.editAccountView.add(root.editAccountTable)

root.submitEdit = () ->
	email = root.user.email
	password = root.user.password
	repeatPass = root.user.password
	firstName = root.user.firstName
	lastName = root.user.lastName
	if root.passwordText.value isnt ''
		password = Titanium.Utils.md5HexDigest(root.passwordText.value)
	if root.repeatPassText.value isnt ''
		repeatPass = Titanium.Utils.md5HexDigest(root.repeatPassText.value)
	if root.firstNameText.value isnt ''
		firstName = root.firstNameText.value
	if root.lastNameText.value isnt ''
		lastName = root.lastNameText.value 
	validate = root.validateNewAccountData(email,password,firstName,lastName,repeatPass)
	if validate is true
		root.showLoading(root.editAccountWindow)
		root.doRegister(email,password,firstName,lastName,root.user.id)
	else
		Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:L('reviewData') + ': ' + validate}).show()
 
	



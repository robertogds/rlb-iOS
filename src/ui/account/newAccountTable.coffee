root.newAccountTable = Titanium.UI.createTableView
	top: 85
	height: 176
	width: '95%'
	borderWidth:0
	borderRadius: 10
	scrollable: false
	moving: false
	backgroundColor: '#fff'

firstNameText = Titanium.UI.createTextField
	backgroundColor: '#fff'
	width: '90%'
	height: '90%'
	color:'#336699'
	hintText: Ti.Locale.getString('firstName')
	clearOnEdit: false
	paddingLeft: 10
	returnKeyType: Titanium.UI.RETURNKEY_NEXT

firstNameText.addEventListener 'return', (e) ->
	lastNameText.focus()

lastNameText = Titanium.UI.createTextField
	backgroundColor: '#fff'
	width: '90%'
	height: '90%'
	color:'#336699'
	hintText: Ti.Locale.getString('lastName')
	clearOnEdit: false
	paddingLeft: 10
	returnKeyType: Titanium.UI.RETURNKEY_NEXT

lastNameText.addEventListener 'return', (e) ->
	emailText.focus()

emailText = Titanium.UI.createTextField
	backgroundColor: '#fff'
	width: '90%'
	height: '90%'
	color:'#336699'
	hintText: Ti.Locale.getString('email')
	clearOnEdit: false
	paddingLeft: 10
	keyboardType: Titanium.UI.KEYBOARD_EMAIL
	returnKeyType: Titanium.UI.RETURNKEY_NEXT

emailText.addEventListener 'return', (e) ->
	passwordText.focus()


passwordText = Titanium.UI.createTextField
	backgroundColor: '#fff'
	width: '90%'
	height: '90%'
	color:'#336699'
	hintText: Ti.Locale.getString('password')
	paddingLeft: 10
	clearOnEdit: true
	passwordMask:true

passwordText.addEventListener 'return', (e) ->
	email = emailText.value
	password = passwordText.value
	firstName = firstNameText.value
	lastName = lastNameText.value
	validate = root.validateNewAccountData(email,password,firstName,lastName,password)
	if validate is true
		root.showLoading(root.newAccountWindow)
		root.doRegister(email,password,firstName,lastName)
	else
		Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:L('reviewData') + ': ' + validate}).show()
  
root.newAccountSection = Titanium.UI.createTableViewSection()
root.newAccountData = []
firstNameRow = Titanium.UI.createTableViewRow
	width: '100%'
	height: 44
lastNameRow = Titanium.UI.createTableViewRow
	width: '100%'
	height: 44
emailRow = Titanium.UI.createTableViewRow
	width: '100%'
	height: 44
passwordRow = Titanium.UI.createTableViewRow
	width: '100%'
	height: 44

firstNameRow.add(firstNameText)
lastNameRow.add(lastNameText)
emailRow.add(emailText)
passwordRow.add(passwordText)

root.newAccountSection.add(firstNameRow)
root.newAccountSection.add(lastNameRow)
root.newAccountSection.add(emailRow)
root.newAccountSection.add(passwordRow)

root.newAccountButton = new root.GenericButton(280,Ti.Locale.getString('register')).button

root.newAccountButton.addEventListener 'click', (e) ->
	email = emailText.value
	password = passwordText.value
	firstName = firstNameText.value
	lastName = lastNameText.value
	validate = root.validateNewAccountData(email,password,firstName,lastName,password)
	if validate is true
		root.showLoading(root.newAccountWindow)
		root.doRegister(email,password,firstName,lastName)    
	else
		Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:L('reviewData') + ': '+ validate}).show()

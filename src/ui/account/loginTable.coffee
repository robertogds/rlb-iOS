root.loginTable = Titanium.UI.createTableView
	top: 100
	height: 88
	width: '90%'
	borderWidth:0
	borderRadius: 10
	scrollable: false
	moving: false
	backgroundColor: '#fff'

root.emailText = Titanium.UI.createTextField
	width: '90%'
	height: '90%'
	color:'#336699'
	backgroundColor: '#fff'
	hintText: Ti.Locale.getString('email')
	clearOnEdit: true
	paddingLeft: 10
	suppressReturn: 1
	keyboardType: Titanium.UI.KEYBOARD_EMAIL
	returnKeyType: Titanium.UI.RETURNKEY_NEXT 

root.emailText.addEventListener 'return', (e) ->
	root.passText.focus()

root.passText = Titanium.UI.createTextField
	backgroundColor: '#fff'
	width: '90%'
	height: '90%'
	color:'#336699'
	hintText: Ti.Locale.getString('password')
	paddingLeft: 10
	clearOnEdit: true
	passwordMask:true
	returnKeyType: Titanium.UI.RETURNKEY_DONE

root.passText.addEventListener 'return', (e) ->
	#root.passText.blur()
	email = root.emailText.value
	password = root.passText.value
	validate = root.validateLoginData(email,password)
	if validate is true
		password = Titanium.Utils.md5HexDigest(password)
		root.showLoading(root.signInView)
		root.doLogin(email,password)
	else
		Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:L('reviewData') + validate}).show()
	

section = Titanium.UI.createTableViewSection()
data = []
row1 = Titanium.UI.createTableViewRow
	width: '100%'
	height: 44
row1.add(root.emailText)
row2 = Titanium.UI.createTableViewRow
	width: '100%'
	height: 44
row2.add(root.passText)
section.add(row1)
section.add(row2)
data[0] = section
root.loginTable.data = data
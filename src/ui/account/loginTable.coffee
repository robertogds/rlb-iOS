root.loginTable = Titanium.UI.createTableView
  top: 40
  height: 88
  width: '95%'
  borderWidth:0
  borderRadius: 10
  scrollable: false
  moving: false
  backgroundColor: '#fff'

emailText = Titanium.UI.createTextField
  width: '100%'
  color:'#336699'
  backgroundColor: '#fff'
  hintText: Ti.Locale.getString('email')
  clearOnEdit: true
  paddingLeft: 10
  suppressReturn: 1
  keyboardType: Titanium.UI.KEYBOARD_EMAIL
  returnKeyType: Titanium.UI.RETURNKEY_NEXT 

emailText.addEventListener 'return', (e) ->
  passText.focus()

passText = Titanium.UI.createTextField
  backgroundColor: '#fff'
  width: '100%'
  color:'#336699'
  hintText: Ti.Locale.getString('password')
  paddingLeft: 10
  clearOnEdit: true
  passwordMask:true

passText.addEventListener 'return', (e) ->
  email = emailText.value
  password = passText.value
  validate = root.validateLoginData(email,password)
  if validate is true
    password = Titanium.Utils.md5HexDigest(password)
    root.doLogin(email,password)
  else
   alert Ti.Locale.getString('reviewData') + validate


section = Titanium.UI.createTableViewSection()
data = []
row1 = Titanium.UI.createTableViewRow
  width: '100%'
  height: 44
row1.add(emailText)
row2 = Titanium.UI.createTableViewRow
  width: '100%'
  height: 44
row2.add(passText)
section.add(row1)
section.add(row2)
data[0] = section
root.loginTable.data = data
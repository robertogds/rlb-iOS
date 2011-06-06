Ti.include(
  'js/registerButton.js'
  'js/newAccountView.js'
  'js/loginAction.js'
)

root.loginView = Titanium.UI.createView
  background: "transparent"
  borderWidth: 0
  width: 320
  height: 300
  top: 70

loginLabel = Titanium.UI.createLabel
  borderWidth: 0
  text: "¿Ya eres usuario? Identificate"
  color: '#fff'
  left: 5
  font:
    fontSize: 14
    fontWeight: 'bold'
  height: 30
  width: 300
  top: 1

emailText = Titanium.UI.createTextField
  color:'#336699'
  hintText: 'Email'
  clearOnEdit: true
  paddingLeft: 10
  suppressReturn: 1
  keyboardType: Titanium.UI.KEYBOARD_EMAIL
  returnKeyType: Titanium.UI.RETURNKEY_NEXT 

emailText.addEventListener 'return', (e) ->
  passText.focus()

passText = Titanium.UI.createTextField
  color:'#336699'
  hintText: 'Clave'
  paddingLeft: 10
  clearOnEdit: true
  passwordMask:true

passText.addEventListener 'return', (e) ->
  email = emailText.value
  pass = passText.value
  root.doLogin(email,pass)
  1


loginTable = Titanium.UI.createTableView
  top: 35
  height: 85
  width: 300
  borderWidth:0
  borderRadius: 10
  scrollable: false
  moving: false

section = Titanium.UI.createTableViewSection()
#section.headerTitle = "Login"
data = []
row1 = Titanium.UI.createTableViewRow()
row1.add(emailText)
row2 = Titanium.UI.createTableViewRow()
row2.add(passText)
section.add(row1)
section.add(row2)
data[0] = section
loginTable.data = data

needLabel = Titanium.UI.createLabel
  borderWidth: 0
  text: "¿Necesitas una cuenta? Regístrate gratis"
  color: '#fff'
  left: 5
  font:
    fontSize: 14
    fontWeight: 'bold'
  height: 30
  width: 300
  top: 150

root.loginView.add(loginTable)
root.loginView.add(needLabel)
root.loginView.add(loginLabel)
root.loginView.add(root.registerButton)

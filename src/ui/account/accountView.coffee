Ti.include(
  'js/registerButton.js'
)

root.accountView = Titanium.UI.createView
  backgroundImage: 'images/background1.png'
  width:320

Titanium.Facebook.appid = "210123832352906"
Titanium.Facebook.permissions = ['publish_stream', 'read_stream']

Titanium.Facebook.addEventListener 'click', (e) ->
  alert('Logged in') if e.success 

Titanium.Facebook.addEventListener 'logout', (e) ->
  alert('Logged out')

# add the button.  Note that it doesn't need a click event or anything.
root.facebookButton = Titanium.Facebook.createLoginButton 
  top: 20 
  style: 'wide'

root.loginView = Titanium.UI.createView
  background: "transparent"
  borderWidth: 0
  width: 300
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

userText = Titanium.UI.createTextField
  color:'#336699'
  hintText: 'Usuario'
  clearOnEdit: true
  paddingLeft: 10
  suppressReturn: true
  #borderStyle:Titanium.UI.INPUT_BORDERSTYLE_ROUNDED

passText = Titanium.UI.createTextField
  color:'#336699'
  hintText: 'Clave'
  paddingLeft: 10
  clearOnEdit: true
  passwordMask:true
  #borderStyle:Titanium.UI.INPUT_BORDERSTYLE_ROUNDED

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
row1.add(userText)
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
root.accountView.add(root.loginView)
root.accountView.add(root.facebookButton)
root.accountWindow.add(root.accountView)

Ti.include(
  'js/newAccountButton.js'
)

root.newAccountView = Titanium.UI.createView
  backgroundImage: 'images/background1.png'
  width:320

root.newAccountTable = Titanium.UI.createTableView
  top: 20
  height: 175
  width: 300
  borderWidth:0
  borderRadius: 10
  scrollable: false
  moving: false

firstNameText = Titanium.UI.createTextField
  color:'#336699'
  hintText: 'Nombre'
  clearOnEdit: true
  paddingLeft: 10
  suppressReturn: true

lastNameText = Titanium.UI.createTextField
  color:'#336699'
  hintText: 'Apellidos'
  clearOnEdit: true
  paddingLeft: 10
  suppressReturn: true

emailText = Titanium.UI.createTextField
  color:'#336699'
  hintText: 'Email'
  clearOnEdit: true
  paddingLeft: 10
  suppressReturn: true


passwordText = Titanium.UI.createTextField
  color:'#336699'
  hintText: 'Clave'
  paddingLeft: 10
  clearOnEdit: true
  passwordMask:true


root.newAccountSection = Titanium.UI.createTableViewSection()
#section.headerTitle = "Login"
root.newAccountData = []
firstNameRow = Titanium.UI.createTableViewRow()
lastNameRow = Titanium.UI.createTableViewRow()
emailRow = Titanium.UI.createTableViewRow()
passwordRow = Titanium.UI.createTableViewRow()

firstNameRow.add(firstNameText)
lastNameRow.add(lastNameText)
emailRow.add(emailText)
passwordRow.add(passwordText)

root.newAccountSection.add(firstNameRow)
root.newAccountSection.add(lastNameRow)
root.newAccountSection.add(emailRow)
root.newAccountSection.add(passwordRow)


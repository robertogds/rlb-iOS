root.editAccountView = Titanium.UI.createView
  backgroundColor: 'transparent'
  width:320

root.editAccountTable = Titanium.UI.createTableView
  top: 20
  height: 175
  width: 300
  borderWidth:0
  borderRadius: 10
  scrollable: false
  moving: false

root.firstNameText = Titanium.UI.createTextField
  color:'#336699'
  hintText: 'Nombre'
  clearOnEdit: true
  paddingLeft: 10
  returnKeyType: Titanium.UI.RETURNKEY_NEXT

root.firstNameText.addEventListener 'return', (e) ->
  root.lastNameText.focus()

root.lastNameText = Titanium.UI.createTextField
  color:'#336699'
  hintText: 'Apellidos'
  clearOnEdit: true
  paddingLeft: 10
  returnKeyType: Titanium.UI.RETURNKEY_NEXT

root.lastNameText.addEventListener 'return', (e) ->
  root.emailText.focus()

root.emailText = Titanium.UI.createTextField
  color:'#336699'
  hintText: 'Email'
  clearOnEdit: true
  paddingLeft: 10
  keyboardType: Titanium.UI.KEYBOARD_EMAIL
  returnKeyType: Titanium.UI.RETURNKEY_NEXT

root.emailText.addEventListener 'return', (e) ->
  root.passwordText.focus()


root.passwordText = Titanium.UI.createTextField
  color:'#336699'
  hintText: 'Clave'
  paddingLeft: 10
  clearOnEdit: true
  passwordMask:true

root.passwordText.addEventListener 'return', (e) ->
  root.submitEdit()
  
root.editAccountSection = Titanium.UI.createTableViewSection()
root.editAccountData = []
firstNameRow = Titanium.UI.createTableViewRow()
lastNameRow = Titanium.UI.createTableViewRow()
emailRow = Titanium.UI.createTableViewRow()
passwordRow = Titanium.UI.createTableViewRow()

firstNameRow.add(root.firstNameText)
lastNameRow.add(root.lastNameText)
emailRow.add(root.emailText)
passwordRow.add(root.passwordText)

root.editAccountSection.add(firstNameRow)
root.editAccountSection.add(lastNameRow)
root.editAccountSection.add(emailRow)
root.editAccountSection.add(passwordRow)

sendButton = new root.GenericButton(250,'Enviar').button

sendButton.addEventListener 'click', (e) ->
  root.submitEdit()

root.editAccountView.add(sendButton)
root.editAccountWindow.add(root.editAccountView)

root.loadEditLoggedUser = () ->
  root.firstNameText.hintText = 'Nombre: '+root.user.firstName
  root.lastNameText.hintText =  'Apellidos: '+root.user.lastName
  root.emailText.hintText = 'Email: '+root.user.email
  root.passwordText.hintText = 'Password: *******'
  root.editAccountData[0] = root.editAccountSection
  root.editAccountTable.data = root.editAccountData
  root.editAccountView.add(root.editAccountTable)

root.submitEdit = () ->
  email = root.user.email
  password = root.user.password
  firstName = root.user.firstName
  lastName = root.user.lastName
  if root.emailText.value isnt ''
    email = root.emailText.value
  if root.passwordText.value isnt ''
    password = root.passwordText.value
  if root.firstNameText.value isnt ''
    firstName = root.firstNameText.value
  if root.lastNameText.value isnt ''
    lastName = root.lastNameText.value 
  validate = root.validateNewAccountData(email,password,firstName,lastName)
  if validate is true
    root.editAccountWindow.add(root.loadingView)
    root.doRegister(email,password,firstName,lastName,root.user.id)
  else
    alert 'Revisa los datos: ' + validate
 
	



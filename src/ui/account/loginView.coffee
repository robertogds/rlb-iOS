Ti.include(
  '/js/newAccountView.js'
  '/js/loginAction.js'
  '/js/logoutAction.js'
  '/js/facebookButton.js'
  '/js/loginTable.js'
  '/js/rememberPassView.js'
  #'/js/registerButton.js'
)

root.loginView = Titanium.UI.createView
  background: "transparent"
  width: 320
  top: 0

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
  top: 5

rememberPassRowView = new root.GenericRowView(170,'He olvidado mi contraseña')

rememberPassRowView.label.addEventListener 'click', (e) ->
  root.tabGroup.activeTab.open(root.rememberPassWindow,{animated:true})

root.loginView.add(rememberPassRowView.view)


needLabel = Titanium.UI.createLabel
  text: "¿Necesitas una cuenta? Regístrate gratis"
  color: '#fff'
  left: 5
  font:
    fontSize: 14
    fontWeight: 'bold'
  height: 30
  width: 300
  top: 250

registerButton = new root.GenericButton(290,'Registrarme').button

registerButton.addEventListener 'click', (e) ->
  root.newAccountData[0] = root.newAccountSection
  root.newAccountTable.data = root.newAccountData
  root.newAccountView.add(root.newAccountTable)
  root.newAccountWindow.add(root.newAccountView)
  root.tabGroup.activeTab.open(root.newAccountWindow,{animated:true})

root.loginView.add(registerButton)

#root.loginView.add(root.facebookButton)
root.loginView.add(root.loginTable)
root.loginView.add(needLabel)
root.loginView.add(loginLabel)

Ti.include( 
  '/js/newAccountView.js'
  '/js/loginAction.js'
  '/js/logoutAction.js'
  '/js/newFacebookAccount.js'
  '/js/facebookButton.js'
  '/js/loginTable.js'
  '/js/rememberPassView.js'
)

root.loginView = Titanium.UI.createView
  background: "transparent"
  top: 0

loginLabel = Titanium.UI.createLabel
  borderWidth: 0
  text: Ti.Locale.getString('loginLabel')
  color: '#fff'
  left: 5
  font:
    fontSize: 14
    fontWeight: 'bold'
  height: 30
  #width: 300
  top: 5


rememberPassRowView = new root.GenericRowView(150,Ti.Locale.getString('IForgotPassword'))

rememberPassRowView.label.addEventListener 'click', (e) ->
  root.tabGroup.activeTab.open(root.rememberPassWindow,{animated:true})

root.loginView.add(rememberPassRowView.view)

needLabel = Titanium.UI.createLabel
  text: Ti.Locale.getString('needAccount')
  color: '#fff'
  left: 5
  font:
    fontSize: 14
    fontWeight: 'bold'
  height: 30
#  width: '95%'
  top: 270

registerButton = new root.GenericButton(310,Ti.Locale.getString('register')).button

registerButton.addEventListener 'click', (e) ->
  root.newAccountData[0] = root.newAccountSection
  root.newAccountTable.data = root.newAccountData
  root.newAccountView.add(root.newAccountTable)
  root.newAccountWindow.add(root.newAccountView)
  root.tabGroup.activeTab.open(root.newAccountWindow,{animated:true})

root.loginView.add(registerButton)
root.loginView.add(root.facebookLoginButton)
root.loginView.add(root.loginTable)
root.loginView.add(needLabel)
root.loginView.add(loginLabel)

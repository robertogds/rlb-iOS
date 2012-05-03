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
  top: 5


rememberAndSupportView = new root.Generic2RowsView(150,Ti.Locale.getString('IForgotPassword'),Ti.Locale.getString('userSupport'))

rememberAndSupportView.label1.addEventListener 'click', (e) ->
	root.tabGroup.activeTab.open(root.rememberPassWindow,{animated:true})

rememberAndSupportView.label2.addEventListener 'click', (e) ->
	root.tabGroup.activeTab.open(root.supportWindow,{animated:true})


root.loginView.add(rememberAndSupportView.view)

needLabel = Titanium.UI.createLabel
  text: Ti.Locale.getString('needAccount')
  color: '#fff'
  left: 5
  font:
    fontSize: 14
    fontWeight: 'bold'
  height: 30
#  width: '95%'
  top: 280

registerButton = new root.GenericButton(310,Ti.Locale.getString('register')).button

registerButton.addEventListener 'click', (e) ->
  root.newAccountData[0] = root.newAccountSection
  root.newAccountTable.data = root.newAccountData
  root.newAccountView.add(root.newAccountTable)
  root.newAccountWindow.add(root.newAccountView)
  root.tabGroup.activeTab.open(root.newAccountWindow,{animated:true})

#root.loginView.add(registerButton)
#root.loginView.add(root.facebookLoginButton)
#root.loginView.add(root.loginTable)
#root.loginView.add(needLabel)
#root.loginView.add(loginLabel)

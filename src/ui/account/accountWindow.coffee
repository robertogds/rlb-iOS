Ti.include(
  '/js/userLoggedTable.js'
  '/js/loginView.js'
  '/js/loggedView.js'
  '/js/rememberPassAction.js'
  '/js/accountView.js'
)
root.accountWindow.addEventListener 'focus', (e) ->
  Ti.API.info('__________________________ ABRE ACCOUNT ******************')
  if Titanium.App.Properties.hasProperty("user")
    Ti.API.info 'Entra en esta logado por RLB'
    root.loginView.hide()
    root.loggedView.show()
    root.loadLoggedUser()
  else if Titanium.Facebook.loggedIn
    Ti.API.info 'Entra en esta logado por facebook'
    root.loginView.hide()
    root.loggedView.show()
    Ti.API.info 'LLega a loadLogged'
    root.loadLoggedFacebookUser()
  else
    root.loginView.show()
    root.loggedView.hide()
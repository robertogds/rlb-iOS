root.accountWindow.addEventListener 'focus', (e) ->
  if Titanium.App.Properties.hasProperty("user")
    root.loginView.hide()
    root.loggedView.show()
    root.loadLoggedUser()
  else
    root.loginView.show()
    root.loggedView.hide()
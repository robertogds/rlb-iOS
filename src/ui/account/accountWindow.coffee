root.accountWindow.addEventListener 'focus', (e) ->
  if Titanium.App.Properties.hasProperty("user")
    root.loginView.hide()
    root.loggedView.show()
    root.loggedLabel.text = "Estas logado como " + root.user.email
    root.loggedView.add(root.loggedLabel)
  else
    root.loginView.show()
    root.loggedView.hide()
  1
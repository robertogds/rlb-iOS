root.accountWindow.addEventListener 'focus', (e) ->
  if root.userEmail isnt null
    root.loginView.hide()
    root.loggedView.show()
    root.loggedLabel.text = "Estas logado como " + root.userEmail
    root.loggedView.add(root.loggedLabel)
  else
    root.loginView.show()
    root.loggedView.hide()
  1
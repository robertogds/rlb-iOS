root.doLogout = () ->
  root.user = null 
  Titanium.App.Properties.removeProperty("user")
  root.loginView.show()
  root.loggedView.hide()
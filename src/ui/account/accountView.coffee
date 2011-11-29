root.accountView = Titanium.UI.createView
  backgroundColor: 'transparent'
  #width:320


root.accountView.add(root.loginView)
root.accountView.add(root.loggedView)
root.accountWindow.add(root.accountView)

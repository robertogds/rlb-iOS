root.bookView = Titanium.UI.createView
  background: 'transparent'
  borderWidth: 0
  width:320
  top: 0

root.bookWindow.add(root.bookView)

root.showBookView = (deal) ->
  root.bookWindow.add(root.bookView)
  	
  if Titanium.Facebook.loggedIn
    root.tabGroup.activeTab.open(root.bookWindow,{animated:true})
  else 
    root.tabGroup.activeTab.open(root.accountWindow,{animated:true})
  1


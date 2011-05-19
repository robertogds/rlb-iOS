root.bookView = Titanium.UI.createView
  background: 'transparent'
  borderWidth: 0
  width:320
  top: 0



root.showBookView = (deal) ->
  root.bookWindow.add(root.bookView)	
  root.tabGroup.activeTab.open(root.bookWindow,{animated:true});
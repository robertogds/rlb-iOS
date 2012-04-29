root.noDealsView = Titanium.UI.createView
	#backgroundColor: 'transparent'
	backgroundImage: '/images/Texture.jpg'

title = L('noDealsTitle')
text = L('noDealsText')

closedView =  new root.GenericTextView(0,title,text).view

root.noDealsView.add(closedView)
root.noDealsWindow.add(root.noDealsView)
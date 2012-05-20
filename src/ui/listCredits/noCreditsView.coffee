root.noCreditsView = Titanium.UI.createView
	backgroundImage: '/images/Texture.jpg'

noCreditsView =  new root.GenericTextView(0,L('bookingTonight'),L('yetNoBook')).view

root.noCreditsView.add(noCreditsView)
root.listCreditsWindow.add(root.noCreditsView)
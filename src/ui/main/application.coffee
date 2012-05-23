Titanium.UI.setBackgroundColor('black')

# Application Windows
root.citiesWindow = new root.GenericWindow(L('cities')).win
root.countriesWindow = new root.GenericWindow(L('countries')).win
root.listDealsWindow = new root.GenericWindow('Madrid').win
root.listDealsMapWindow = new root.GenericWindow(L('map')).win
root.bookingsWindow = new root.GenericWindow(L('yourBookings')).win
root.listCreditsWindow = new root.GenericWindow(L('creditsHistory')).win
root.accountWindow = new root.GenericWindow(L('profile')).win
root.oneDealWindow = new root.GenericWindow('').win
root.oneBookingWindow = new root.GenericWindow(L('booking')).win
root.optionsWindow = new root.GenericWindow(L('options')).win
root.imagesWindow = new root.GenericWindow(L('photos')).win
root.newAccountWindow = new root.GenericWindow(L('newAccount')).win
root.editAccountWindow = new root.GenericWindow(L('editAccount')).win
root.confirmBookingWindow = new root.GenericWindow(L('orderSummary')).win
root.supportWindow = new root.GenericWindow(L('userSupport')).win
root.errorWindow = new root.GenericWindow('Error').win
root.aboutWindow = new root.GenericWindow(L('about')).win
root.forHotelsWindow = new root.GenericWindow(L('toHotels')).win
root.termsWindow = new root.GenericWindow(L('terms')).win
root.faqWindow = new root.GenericWindow('FAQ').win
root.privacyWindow = new root.GenericWindow(L('privacy')).win
root.rememberPassWindow = new root.GenericWindow(L('resetPassword')).win
root.paymentWindow = new root.GenericWindow(L('creditCard')).win
root.bookingForWindow = new root.GenericWindow(L('bookingFor')).win
root.nightsWindow = new root.GenericWindow(L('extraNights')).win
root.why3Window = new root.GenericWindow('ReallyLateBooking').win
root.signInWindow = new root.GenericWindow(L('signIn')).win
root.registerWindow = new root.GenericWindow(L('register')).win
root.noDealsWindow = new root.GenericWindow('').win
root.cobrarWindow = new root.GenericWindow('Cobrar').win
root.creditsWindow = new root.GenericWindow(L('credits')).win
root.inviteWindow = new root.GenericWindow(L('invite')).win
root.allCitiesWindow = new root.GenericWindow(L('cities')).win


root.imagesWindow.backButtonTitle = L('back')
root.imagesWindow.tabBarHidden = true

# Application Tabs 336699
root.tabGroup = Titanium.UI.createTabGroup
	barColor:'black' 
	id:'tabGroup'

root.dealsTab = Titanium.UI.createTab
	id:'deals'
	icon:'icons/ico_deals.png'
	title:L('cities')
	window: root.citiesWindow
  
root.bookingTab = Titanium.UI.createTab
	id: 'booking'
	icon:'icons/ico_bookings.png'
	title:L('bookings')
	window: root.bookingsWindow

root.inviteTab = Titanium.UI.createTab
	id: 'invite'
	icon:'icons/ico_invite.png'
	title:L('invite')
	window: root.inviteWindow

root.creditsTab = Titanium.UI.createTab
	id: 'credits'
	icon:'icons/ico_credits.png'
	title:L('credits')
	badge: undefined
	window: root.creditsWindow

root.optionsTab = Titanium.UI.createTab
	id: 'options'
	icon:'icons/ico_options.png'
	title:L('options')
	window: root.optionsWindow

root.tabGroup.addTab(root.dealsTab)
root.tabGroup.addTab(root.bookingTab)
root.tabGroup.addTab(root.inviteTab)
root.tabGroup.addTab(root.creditsTab)
root.tabGroup.addTab(root.optionsTab)

root.tabGroup.open()


root.showError = (window) ->
	if window is undefined
		window = Titanium.UI.currentWindow
	root.errorWindow = window
	window.add(root.errorView)


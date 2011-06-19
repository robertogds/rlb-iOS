Ti.include(
  '/js/confirmButton.js'
  '/js/bookingAction.js'
  '/js/expiresView.js'
  '/js/cardTypeView.js'
  '/js/creditCardTable.js'
)
root.bookingView = Titanium.UI.createView
  background: 'transparent'
  borderWidth: 0
  width:320
  top: 0


root.bookingView.add(root.confirmButton)
root.confirmBookingWindow.add(root.bookingView)


root.showBookingView = () ->
  if Titanium.App.Properties.hasProperty("user")
    root.creditCardData[0] = root.creditCardSection
    root.creditCardTable.data = root.creditCardData
    root.bookingView.add(root.creditCardTable)
    root.confirmBookingWindow.add(root.bookingView)
    root.tabGroup.activeTab.open(root.confirmBookingWindow,{animated:true})
  else
    alert 'Debes estar registrado para poder hacer una reserva'
    root.tabGroup.setActiveTab(2)
  1
Ti.include(
  '/js/expiresView.js'
  '/js/cardTypeView.js'
  '/js/creditCardTable.js'
  '/js/bookingAction.js'
)
root.bookingView = Titanium.UI.createView
  background: 'transparent'
  borderWidth: 0
  width:320
  top: 0

confirmButton = new root.GenericButton(280,'Confirmar').button 

confirmButton.addEventListener 'click', (e) ->
  root.doBooking()

root.bookingView.add(confirmButton)
root.confirmBookingWindow.add(root.bookingView)
root.oneClassBookingView =  new root.GenericTextView(0,'Reserva','Reserva').view
root.oneBookingWindow.add(root.oneClassBookingView)

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
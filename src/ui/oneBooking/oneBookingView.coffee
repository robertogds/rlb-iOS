root.closeBookingButton = new root.GenericButton(280,L('close')).button

root.closeBookingButton.addEventListener 'click', (e) ->
  root.confirmBookingWindow.close()
  root.oneDealWindow.close()
  root.oneBookingWindow.close() 
  root.tabGroup.setActiveTab(1)


root.showOneBookingView = (@booking) ->
  Ti.API.error booking
  #checkinDate = new Date(booking.checkinDate)
  #checkoutDate = new Date(booking.checkoutDate)
  title = L('booking') + ' : ' + booking.code
  text = L('hotel')+': ' + booking.hotelName + '\n'+L('checkin')+': ' + booking.checkinDate + '\n'
  #text = text + L('checkin') + ': ' +  root.getLocaleDateString(checkinDate) + '\n'
  #text = text + L('checkout') + ': ' +  root.getLocaleDateString(checkoutDate) + '\n'
  text = text + L('nights') + ': ' + booking.nights + '\n\n'
  text = text + L('salePrice')+': ' + booking.salePriceCents + '€ '+L('regularPrice')+': ' + booking.priceCents + ' € \n\n\n'
  text = text + L('oneBookingText')
  root.oneBookingWindow.remove(root.oneClassBookingView)
  root.oneClassBookingView =  new root.GenericTextView(0,title,text).view
  root.oneBookingWindow.add(root.oneClassBookingView)



root.closeBookingButton = new root.GenericButton(280,L('close')).button

root.closeBookingButton.addEventListener 'click', (e) ->
  root.confirmBookingWindow.close()
  root.oneDealWindow.close()
  root.oneBookingWindow.close() 
  root.tabGroup.setActiveTab(1)


root.showOneBookingView = (@booking) ->
  Ti.API.error booking
  title = L('booking') + ' : ' + booking.code
  text = L('hotel')+': ' + booking.hotelName + '\n'+L('bookingDate')+': ' + booking.checkinDate + '\n\n'
  text = text + L('salePrice')+': ' + booking.salePriceCents + '€ '+L('regularPrice')+': ' + booking.priceCents + ' € \n\n\n'
  text = text + L('oneBookingText')
  root.oneBookingWindow.remove(root.oneClassBookingView)
  root.oneClassBookingView =  new root.GenericTextView(0,title,text).view
  root.oneBookingWindow.add(root.oneClassBookingView)



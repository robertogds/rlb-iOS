root.closeBookingButton = new root.GenericButton(280,'Cerrar').button

root.closeBookingButton.addEventListener 'click', (e) ->
  root.confirmBookingWindow.close()
  root.oneDealWindow.close()
  root.oneBookingWindow.close() 
  root.tabGroup.setActiveTab(1)


root.showOneBookingView = (@booking) ->
  title = 'Reserva : ' + booking.code
  text = 'Hotel: ' + booking.hotelName + '\nFecha de la reserva: ' + booking.checkinDate + '\n\n'
  text = text + 'Precio Oferta: ' + booking.salePriceCents + '€ Precio habitual: ' + booking.priceCents + ' € \n\n\n'
  text = text + 'Esta pantalla en tu móvil sirve como justificante en la recepción del hotel.\nPuedes volver a acceder a ella desde la pestaña Mis Reservas'
  root.oneBookingWindow.remove(root.oneClassBookingView)
  root.oneClassBookingView =  new root.GenericTextView(0,title,text).view
  root.oneBookingWindow.add(root.oneClassBookingView)



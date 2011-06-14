(function() {
  Ti.include('js/closeBookingButton.js');
  root.showOneBookingView = function(booking) {
    var oneBookingView, text, title;
    this.booking = booking;
    title = 'Reserva : ' + booking.code;
    text = 'Hotel: ' + booking.hotelName + '\nFecha de la reserva: ' + booking.checkinDate + '\n\n';
    text = text + 'Precio Oferta: ' + booking.salePriceCents + '€ Precio habitual: ' + booking.priceCents + ' € \n\n\n';
    text = text + 'Esta pantalla en tu móvil sirve como justificante en la recepción del hotel.';
    oneBookingView = new root.GenericTextView(0, title, text).view;
    root.oneBookingWindow.add(oneBookingView);
    return 1;
  };
}).call(this);

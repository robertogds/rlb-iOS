(function() {

  root.closeBookingButton = new root.GenericButton(280, L('close')).button;

  root.closeBookingButton.addEventListener('click', function(e) {
    root.confirmBookingWindow.close();
    root.oneDealWindow.close();
    root.oneBookingWindow.close();
    return root.tabGroup.setActiveTab(1);
  });

  root.showOneBookingView = function(booking) {
    var text, title;
    this.booking = booking;
    Ti.API.error(booking);
    title = L('booking') + ' : ' + booking.code;
    text = L('hotel') + ': ' + booking.hotelName + '\n' + L('checkin') + ': ' + booking.checkinDate + '\n';
    text = text + L('nights') + ': ' + booking.nights + '\n\n';
    text = text + L('salePrice') + ': ' + booking.salePriceCents + '€ ' + L('regularPrice') + ': ' + booking.priceCents + ' € \n\n\n';
    text = text + L('oneBookingText');
    root.oneBookingWindow.remove(root.oneClassBookingView);
    root.oneClassBookingView = new root.GenericTextView(0, title, text).view;
    return root.oneBookingWindow.add(root.oneClassBookingView);
  };

}).call(this);

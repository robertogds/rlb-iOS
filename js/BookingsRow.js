(function() {
  var BookingsRow;
  BookingsRow = function() {
    function BookingsRow(booking) {
      var bookingLabel;
      this.row = Ti.UI.createTableViewRow({
        hasChild: true,
        rightImage: '/images/yellow_arrow.png',
        booking: booking,
        backgroundGradient: {
          type: 'linear',
          colors: [
            {
              color: '#07151d',
              position: 0.1
            }, {
              color: '#0d1e28',
              position: 1.0
            }
          ]
        }
      });
      bookingLabel = Titanium.UI.createLabel({
        text: booking.checkinDate + '   ' + booking.hotelName + '    ' + booking.priceCents + '€',
        color: '#fff',
        font: {
          fontSize: 12,
          fontWeight: 'bold'
        },
        left: 10
      });
      this.row.add(bookingLabel);
    }
    return BookingsRow;
  }();
  root.BookingsRow = BookingsRow;
}).call(this);

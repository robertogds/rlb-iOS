(function() {
  var BookingsRow;

  BookingsRow = (function() {

    function BookingsRow(booking) {
      this.row = Ti.UI.createTableViewRow({
        hasChild: true,
        rightImage: '/images/yellow_arrow.png',
        backgroundGradient: root.bgGradient,
        booking: booking
      });
    }

    return BookingsRow;

  })();

  root.BookingsRow = BookingsRow;

}).call(this);

(function() {
  Ti.include('js/bookingsTable.js', 'js/noBookingsView.js');
  root.bookingsWindow.addEventListener('focus', function(e) {
    if (Titanium.App.Properties.hasProperty("user")) {
      root.showBookings();
    } else {
      root.noBooksView.show();
    }
    return 1;
  });
}).call(this);

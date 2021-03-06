(function() {

  Ti.include('/js/bookingsTable.js', '/js/noBookingsView.js');

  root.bookingsWindow.addEventListener('focus', function(e) {
    if (Titanium.App.Properties.hasProperty("user") || Titanium.Facebook.loggedIn) {
      root.showBookings();
    } else {
      root.noBookingsView.show();
    }
    return 1;
  });

}).call(this);

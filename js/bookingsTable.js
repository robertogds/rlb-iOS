(function() {
  Ti.include('js/BookingsRow.js');
  root.bookingsTable = Titanium.UI.createTableView({
    data: [],
    backgroundColor: '#0b222e',
    separatorColor: '#0b222e'
  });
  root.bookingsWindow.add(root.bookingsTable);
  root.bookingsTable.addEventListener('click', function(e) {
    root.showOneBookingView(e.row.booking);
    return root.tabGroup.activeTab.open(root.oneBookingWindow, {
      animated: true
    });
  });
  root.xhrBookings = Titanium.Network.createHTTPClient();
  root.xhrBookings.onload = function() {
    var booking, bookingRow, bookings, data, _i, _len;
    bookings = JSON.parse(this.responseText);
    data = [];
    for (_i = 0, _len = bookings.length; _i < _len; _i++) {
      booking = bookings[_i];
      Ti.API.info(booking);
      bookingRow = new root.BookingsRow(booking);
      data.push(bookingRow.row);
    }
    if (data.length === 0) {
      root.bookingsWindow.remove(root.loadingView);
      root.noBookingsView.show();
    } else {
      root.bookingsTable.setData(data);
      root.bookingsWindow.remove(root.loadingView);
    }
    return 1;
  };
  root.xhrBookings.onerror = function() {
    return alert('Se produjo un error. Intentelo más tarde');
  };
  root.xhrBookings.timedOut = function() {
    return alert('Se produjo un timeout. Intentelo más tarde');
  };
  root.showBookings = function() {
    root.noBookingsView.hide();
    root.bookingsWindow.add(root.loadingView);
    root.xhrBookings.open('GET', 'http://rlb-back.appspot.com/user/' + root.user.id + '/bookings');
    return root.xhrBookings.send();
  };
}).call(this);

(function() {
  Ti.include('js/BookingsRow.js');
  root.bookingsTable = Titanium.UI.createTableView({
    data: [],
    backgroundColor: '#0b222e',
    separatorColor: '#0b222e'
  });
  root.bookingsWindow.add(root.bookingsTable);
  root.bookingsTable.addEventListener('click', function(e) {
    root.showBookingsView(e.row.booking);
    return root.tabGroup.activeTab.open(root.oneBookingWindow, {
      animated: true
    });
  });
  root.xhrBookings = Titanium.Network.createHTTPClient();
  root.xhrBookings.onload = function() {
    var booking, bookingRow, bookings, data, _i, _len;
    bookings = JSON.parse(this.responseText);
    alert(bookings);
    data = [];
    for (_i = 0, _len = bookings.length; _i < _len; _i++) {
      booking = bookings[_i];
      Ti.API.info(booking);
      bookingRow = new root.BookingsRow(booking);
      data.push(bookingRow.row);
    }
    root.bookingsTable.setData(data);
    return root.bookingsWindow.remove(root.loadingView);
  };
  root.xhrBookings.onerror = function() {
    return alert('Se produjo un error. Intentelo más tarde');
  };
  root.xhrBookings.timedOut = function() {
    return alert('Se produjo un timeout. Intentelo más tarde');
  };
  root.showBookings = function() {
    alert('Entra en shoBookings');
    root.noBookingsView.hide();
    root.bookingsWindow.add(root.loadingView);
    root.xhrBookings.open('GET', 'http://rlb-back.appspot.com/user/' + root.user.id + '/bookings');
    return root.xhrBookings.send();
  };
}).call(this);

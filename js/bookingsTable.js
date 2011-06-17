(function() {
  Ti.include('/js/BookingsRow.js');
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
    Ti.API.info('Entra en onLoad');
    bookings = JSON.parse(this.responseText);
    data = [];
    for (_i = 0, _len = bookings.length; _i < _len; _i++) {
      booking = bookings[_i];
      bookingRow = new root.BookingsRow(booking);
      data.push(bookingRow.row);
    }
    if (data.length === 0) {
      root.noBookingsView.show();
    } else {
      root.bookingsTable.setData(data);
    }
    return root.bookingsWindow.remove(root.loadingView);
  };
  root.xhrBookings.onerror = function() {
    alert('Se produjo un error. Intentelo más tarde');
    root.bookingsWindow.remove(root.loadingView);
    return root.showError();
  };
  root.xhrBookings.timedOut = function() {
    return alert('Se produjo un timeout. Intentelo más tarde');
  };
  root.showBookings = function() {
    root.noBookingsView.hide();
    root.bookingsWindow.add(root.loadingView);
    root.xhrBookings.open('GET', root.url + '/user/' + root.user.id + '/bookings');
    return root.xhrBookings.send();
  };
}).call(this);

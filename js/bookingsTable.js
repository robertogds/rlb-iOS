(function() {
  Ti.include('/js/BookingsRow.js');
  root.footerView = Titanium.UI.createView({
    backgroundColor: '#0d1e28',
    borderWidth: 0,
    height: 100,
    width: 320
  });
  root.bookingsTable = Titanium.UI.createTableView({
    data: [],
    backgroundColor: '#0d1e28',
    separatorColor: '#1b3c50'
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
    var booking, bookingLabel, bookingRow, bookings, data, _i, _len;
    root.bookingsWindow.remove(root.errorView);
    bookings = JSON.parse(this.responseText);
    data = [];
    for (_i = 0, _len = bookings.length; _i < _len; _i++) {
      booking = bookings[_i];
      bookingRow = new root.BookingsRow(booking);
      bookingLabel = Titanium.UI.createLabel({
        text: booking.checkinDate + '   ' + booking.hotelName + '    ' + booking.salePriceCents + '€',
        color: '#fff',
        font: {
          fontSize: 12,
          fontWeight: 'bold'
        },
        left: 10
      });
      bookingRow.row.add(bookingLabel);
      data.push(bookingRow.row);
    }
    if (data.length === 0) {
      root.noBookingsView.show();
    } else {
      root.bookingsTable.setData(data);
      root.bookingsTable.footerView = root.footerView;
    }
    return root.hideLoading(root.bookingsWindow);
  };
  root.xhrBookings.onerror = function() {
    alert(L('errorHappened'));
    root.hideLoading(root.bookingsWindow);
    return root.showError(root.bookingsWindow);
  };
  root.xhrBookings.timedout = function() {
    return alert(L('errorHappened'));
  };
  root.showBookings = function() {
    var signature, url;
    root.noBookingsView.hide();
    root.showLoading(root.bookingsWindow);
    url = root.urlSignature('/user/' + root.user.id + '/bookings');
    signature = root.doSignature(url);
    url = url + '/' + signature;
    root.xhrBookings.open('GET', root.url + url);
    root.xhrBookings.setRequestHeader("Accept-Language", Titanium.Locale.currentLanguage);
    return root.xhrBookings.send();
  };
}).call(this);

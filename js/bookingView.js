(function() {
  var confirmButton, hotelLabel, nonRefundableLabel, separator1, separator2;

  Ti.include('/js/cardTypeView.js', '/js/expiresView.js', '/js/creditCardTable.js', '/js/paymentView.js', '/js/nightsView.js', '/js/bookingAction.js', '/js/bookingWindow.js', '/js/bookingForView.js', '/js/confirmTable.js');

  root.bookingView = Titanium.UI.createView({
    backgroundColor: 'black',
    borderWidth: 0,
    top: 0
  });

  hotelLabel = Titanium.UI.createLabel({
    top: 4,
    height: 28,
    textAlign: 'center',
    font: {
      fontSize: 20,
      fontWeight: 'bold'
    },
    color: '#fff'
  });

  root.totalLabel = Titanium.UI.createLabel({
    top: 40,
    height: 28,
    text: L('total'),
    color: '#868d92',
    font: {
      fontSize: 20,
      fontWeight: 'bold'
    },
    left: 15
  });

  root.priceLabel = Titanium.UI.createLabel({
    top: 40,
    height: 24,
    color: '#fff',
    textAlign: 'center',
    font: {
      fontSize: 22,
      fontWeight: 'bold'
    },
    left: 180
  });

  separator1 = new root.GenericSeparatorView(80).view;

  separator2 = new root.GenericSeparatorView(259).view;

  root.bookingView.add(root.confirmTable);

  root.bookingView.add(separator1);

  root.bookingView.add(separator2);

  confirmButton = new root.GenericButton(280, L('confirm')).button;

  confirmButton.addEventListener('click', function(e) {
    var validate;
    validate = root.validateBookingData();
    if (validate !== true) {
      return Ti.UI.createAlertDialog({
        title: 'ReallyLateBooking',
        message: L('reviewData') + ': ' + validate
      }).show();
    } else {
      return root.doBooking();
    }
  });

  nonRefundableLabel = Titanium.UI.createLabel({
    borderWidth: 0,
    height: 60,
    top: 310,
    text: L('noRefundable'),
    color: '#fff',
    textAlign: "center",
    font: {
      fontSize: 12,
      fontWeight: 'bold'
    }
  });

  root.bookingView.add(hotelLabel);

  root.bookingView.add(root.totalLabel);

  root.bookingView.add(root.priceLabel);

  root.bookingView.add(nonRefundableLabel);

  root.bookingView.add(confirmButton);

  root.confirmBookingWindow.add(root.bookingView);

  root.oneClassBookingView = new root.GenericTextView(0, L('booking'), L('booking')).view;

  root.oneBookingWindow.add(root.oneClassBookingView);

  root.showBookingView = function() {
    root.bookingNights = 1;
    root.totalPrice = root.deal.salePriceCents;
    if (Titanium.App.Properties.hasProperty("user") || Titanium.Facebook.loggedIn) {
      hotelLabel.text = root.deal.hotelName;
      root.priceLabel.text = root.deal.salePriceCents + ' €';
      root.checkinDate = new Date(root.deal.checkinDate);
      root.checkoutDate = new Date(root.checkinDate.getTime() + 86400000);
      root.checkinLabel.text = root.getLocaleDateString(root.checkinDate);
      root.checkoutLabel.text = root.getLocaleDateString(root.checkoutDate);
      Ti.API.info('*** Abre la pantalla de bookingWindow');
      return root.tabGroup.activeTab.open(root.confirmBookingWindow, {
        animated: true
      });
    } else {
      return Ti.UI.createAlertDialog({
        title: 'ReallyLateBooking',
        message: L('mustUser')
      }).show();
    }
  };

}).call(this);

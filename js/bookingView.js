(function() {
  var bookingForTitleLabel, checkinLabel, checkinTitleLabel, checkoutTitleLabel, confirmButton, data, hotelLabel, nightsRow, nonRefundableLabel, paymentRow, separator1, separator2, totalLabel, userRow;
  Ti.include('/js/cardTypeView.js', '/js/expiresView.js', '/js/creditCardTable.js', '/js/paymentView.js', '/js/nightsView.js', '/js/bookingAction.js', '/js/bookingWindow.js', '/js/bookingForView.js');
  root.bookingView = Titanium.UI.createView({
    backgroundColor: 'black',
    borderWidth: 0,
    top: 0
  });
  root.confirmTable = Titanium.UI.createTableView({
    backgroundColor: '#0d1e28',
    separatorColor: '#1b3c50',
    top: 70,
    height: 180,
    scrollable: false,
    moving: false
  });
  root.confirmTable.addEventListener('click', function(e) {
    if (e.row.id === "nights") {
      root.loadNightsView();
      root.tabGroup.activeTab.open(root.nightsWindow, {
        animated: true
      });
    }
    if (e.row.id === "user") {
      root.tabGroup.activeTab.open(root.bookingForWindow, {
        animated: true
      });
    }
    if (e.row.id === "payment") {
      return root.tabGroup.activeTab.open(root.paymentWindow, {
        animated: true
      });
    }
  });
  hotelLabel = Titanium.UI.createLabel({
    top: 4,
    height: 24,
    color: '#fff',
    textAlign: 'center',
    font: {
      fontSize: 20,
      fontWeight: 'bold'
    }
  });
  totalLabel = Titanium.UI.createLabel({
    top: 40,
    left: 15,
    height: 20,
    text: "Total por 1 noche:",
    color: '#868d92',
    font: {
      fontSize: 20
    }
  });
  ({
    fontWeight: 'bold'
  });
  root.priceLabel = Titanium.UI.createLabel({
    top: 40,
    height: 24,
    left: 180,
    color: '#fff',
    textAlign: 'center',
    font: {
      fontSize: 22,
      fontWeight: 'bold'
    }
  });
  separator1 = new root.GenericSeparatorView(70).view;
  separator2 = new root.GenericSeparatorView(249).view;
  userRow = new root.GenericTextRow().row;
  userRow.rightImage = '/images/blue_arrow.png';
  userRow.height = 60;
  userRow.id = "user";
  paymentRow = new root.GenericTextRow().row;
  paymentRow.rightImage = '/images/blue_arrow.png';
  paymentRow.height = 60;
  paymentRow.id = "payment";
  nightsRow = new root.GenericTextRow().row;
  nightsRow.rightImage = '/images/blue_arrow.png';
  nightsRow.height = 60;
  nightsRow.id = "nights";
  checkinTitleLabel = Titanium.UI.createLabel({
    text: "Check-in:",
    color: '#fff',
    font: {
      fontSize: 14,
      fontWeight: 'bold'
    },
    left: 10,
    height: 20,
    top: 10
  });
  checkoutTitleLabel = Titanium.UI.createLabel({
    text: "Check-out:",
    color: '#fff',
    font: {
      fontSize: 14,
      fontWeight: 'bold'
    },
    left: 10,
    height: 20,
    top: 32
  });
  checkinLabel = Titanium.UI.createLabel({
    color: '#868d92',
    font: {
      fontSize: 14
    },
    left: 90,
    top: 10,
    height: 20
  });
  root.checkoutLabel = Titanium.UI.createLabel({
    color: '#868d92',
    font: {
      fontSize: 14
    },
    left: 90,
    top: 32,
    height: 20
  });
  bookingForTitleLabel = Titanium.UI.createLabel({
    text: L('bookingFor') + ':',
    color: '#fff',
    font: {
      fontSize: 14,
      fontWeight: 'bold'
    },
    left: 10,
    height: 20,
    top: 10
  });
  root.bookingForNameLabel = Titanium.UI.createLabel({
    color: '#868d92',
    font: {
      fontSize: 14
    },
    left: 110,
    height: 20,
    top: 10
  });
  root.bookingForEmailLabel = Titanium.UI.createLabel({
    color: '#868d92',
    font: {
      fontSize: 14
    },
    left: 10,
    top: 32,
    height: 20
  });
  root.paymentLabel = Titanium.UI.createLabel({
    text: L('noPaymentInfo'),
    color: '#fff',
    font: {
      fontSize: 14,
      fontWeight: 'bold'
    },
    left: 10,
    height: 20
  });
  nightsRow.add(checkinTitleLabel);
  nightsRow.add(checkoutTitleLabel);
  nightsRow.add(checkinLabel);
  nightsRow.add(root.checkoutLabel);
  userRow.add(bookingForTitleLabel);
  userRow.add(root.bookingForNameLabel);
  userRow.add(root.bookingForEmailLabel);
  paymentRow.add(root.paymentLabel);
  data = [];
  data.push(nightsRow);
  data.push(userRow);
  data.push(paymentRow);
  root.confirmTable.setData(data);
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
  root.bookingView.add(totalLabel);
  root.bookingView.add(root.priceLabel);
  root.bookingView.add(nonRefundableLabel);
  root.bookingView.add(confirmButton);
  root.confirmBookingWindow.add(root.bookingView);
  root.showBookingView = function() {
    if (Titanium.App.Properties.hasProperty("user") || Titanium.Facebook.loggedIn) {
      root.tabGroup.activeTab.open(root.confirmBookingWindow, {
        animated: true
      });
      hotelLabel.text = root.deal.hotelName;
      root.priceLabel.text = root.deal.salePriceCents + ' €';
      root.checkinDate = new Date(root.deal.checkinDate);
      root.checkoutDate = new Date(root.checkinDate.getTime() + 86400000);
      checkinLabel.text = root.getLocaleDateString(root.checkinDate);
      root.checkoutLabel.text = root.getLocaleDateString(root.checkoutDate);
      Ti.UI.createAlertDialog({
        title: 'ReallyLateBooking',
        message: L('mustUser')
      }).show();
      root.tabGroup.setActiveTab(2);
    }
    return 1;
  };
}).call(this);

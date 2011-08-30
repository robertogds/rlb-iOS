(function() {
  var checkLabel, confirmButton, data, hotelLabel, nightsRow, nonRefundableLabel, paymentRow, priceLabel, totalLabel, userRow;
  Ti.include('/js/cardTypeView.js', '/js/expiresView.js', '/js/creditCardTable.js', '/js/bookingAction.js');
  root.bookingView = Titanium.UI.createView({
    backgroundColor: 'black',
    borderWidth: 0,
    top: 0
  });
  root.confirmTable = Titanium.UI.createTableView({
    backgroundColor: '#0d1e28',
    separatorColor: '#1b3c50',
    top: 70,
    height: 200,
    scrollable: false,
    moving: false
  });
  hotelLabel = Titanium.UI.createLabel({
    top: 4,
    height: 20,
    text: "Hotel Ritz",
    color: '#fff',
    textAlign: 'center',
    font: {
      fontSize: 20,
      fontWeight: 'bold'
    }
  });
  totalLabel = Titanium.UI.createLabel({
    top: 30,
    left: 15,
    height: 18,
    text: "Total por 3 noches:",
    color: '#868d92',
    font: {
      fontSize: 20
    }
  });
  ({
    fontWeight: 'bold'
  });
  priceLabel = Titanium.UI.createLabel({
    top: 30,
    height: 18,
    text: "155 €",
    left: 180,
    color: '#fff',
    textAlign: 'center',
    font: {
      fontSize: 22,
      fontWeight: 'bold'
    }
  });
  userRow = new root.GenericTextRow().row;
  userRow.rightImage = '/images/blue_arrow.png';
  paymentRow = new root.GenericTextRow().row;
  paymentRow.rightImage = '/images/blue_arrow.png';
  nightsRow = new root.GenericTextRow().row;
  nightsRow.rightImage = '/images/blue_arrow.png';
  nightsRow.height = 120;
  checkLabel = Titanium.UI.createLabel({
    text: "Check-in:\nCheck-out:\nRoomType:",
    color: '#fff',
    font: {
      fontSize: 12,
      fontWeight: 'bold'
    },
    left: 10
  });
  nightsRow.add(checkLabel);
  data = [];
  data.push(nightsRow);
  data.push(userRow);
  data.push(paymentRow);
  root.confirmTable.setData(data);
  root.bookingView.add(root.confirmTable);
  confirmButton = new root.GenericButton(290, L('confirm')).button;
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
    top: 320,
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
  root.bookingView.add(priceLabel);
  root.bookingView.add(nonRefundableLabel);
  root.bookingView.add(confirmButton);
  root.confirmBookingWindow.add(root.bookingView);
  root.oneClassBookingView = new root.GenericTextView(0, L('booking'), L('booking')).view;
  root.oneBookingWindow.add(root.oneClassBookingView);
  root.showBookingView = function() {
    if (Titanium.App.Properties.hasProperty("user") || Titanium.Facebook.loggedIn) {
      root.tabGroup.activeTab.open(root.confirmBookingWindow, {
        animated: true
      });
    } else {
      Ti.UI.createAlertDialog({
        title: 'ReallyLateBooking',
        message: L('mustUser')
      }).show();
      root.tabGroup.setActiveTab(2);
    }
    return 1;
  };
}).call(this);

(function() {
  var adviseCardLabel, confirmButton, infoImage;
  Ti.include('/js/cardTypeView.js', '/js/expiresView.js', '/js/creditCardTable.js', '/js/bookingAction.js');
  root.bookingView = Titanium.UI.createView({
    backgroundColor: 'transparent',
    borderWidth: 0,
    width: 320,
    top: 0
  });
  confirmButton = new root.GenericButton(310, L('confirm')).button;
  confirmButton.addEventListener('click', function(e) {
    var validate;
    validate = root.validateBookingData();
    if (validate !== true) {
      return alert(L('reviewData') + ': ' + validate);
    } else {
      return root.doBooking();
    }
  });
  infoImage = Titanium.UI.createImageView({
    top: 240,
    image: '/images/icon_info.png',
    width: 20,
    height: 20,
    left: 2
  });
  root.bookingView.add(infoImage);
  adviseCardLabel = Titanium.UI.createLabel({
    borderWidth: 0,
    borderColor: 'red',
    height: 60,
    top: 240,
    text: L('adviceCard'),
    color: '#fff',
    left: 22,
    font: {
      fontSize: 12,
      fontWeight: 'bold'
    }
  });
  root.bookingView.add(adviseCardLabel);
  root.bookingView.add(confirmButton);
  root.confirmBookingWindow.add(root.bookingView);
  root.oneClassBookingView = new root.GenericTextView(0, L('booking'), L('booking')).view;
  root.oneBookingWindow.add(root.oneClassBookingView);
  root.showBookingView = function() {
    if (Titanium.App.Properties.hasProperty("user") || Titanium.Facebook.loggedIn) {
      root.creditCardData[0] = root.creditCardSection;
      root.creditCardTable.data = root.creditCardData;
      root.bookingView.add(root.creditCardTable);
      root.confirmBookingWindow.add(root.bookingView);
      root.tabGroup.activeTab.open(root.confirmBookingWindow, {
        animated: true
      });
    } else {
      alert(L('mustUser'));
      root.tabGroup.setActiveTab(2);
    }
    return 1;
  };
}).call(this);

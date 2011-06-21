(function() {
  var adviseCardLabel, confirmButton, infoImage;
  Ti.include('/js/expiresView.js', '/js/cardTypeView.js', '/js/creditCardTable.js', '/js/bookingAction.js');
  root.bookingView = Titanium.UI.createView({
    backgroundColor: 'transparent',
    borderWidth: 0,
    width: 320,
    top: 0
  });
  confirmButton = new root.GenericButton(310, 'Confirmar').button;
  confirmButton.addEventListener('click', function(e) {
    var validate;
    validate = root.validateBookingData();
    if (validate !== true) {
      return alert('Revisa los datos: ' + validate);
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
    text: "ReallyLateBooking no hará ningún cargo en tu tarjeta de crédito. La estancia la pagarás en el hotel.\nRecuerda que la reserva no es anulable.",
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
  root.oneClassBookingView = new root.GenericTextView(0, 'Reserva', 'Reserva').view;
  root.oneBookingWindow.add(root.oneClassBookingView);
  root.showBookingView = function() {
    if (Titanium.App.Properties.hasProperty("user")) {
      root.creditCardData[0] = root.creditCardSection;
      root.creditCardTable.data = root.creditCardData;
      root.bookingView.add(root.creditCardTable);
      root.confirmBookingWindow.add(root.bookingView);
      root.tabGroup.activeTab.open(root.confirmBookingWindow, {
        animated: true
      });
    } else {
      alert('Debes estar registrado para poder hacer una reserva');
      root.tabGroup.setActiveTab(2);
    }
    return 1;
  };
}).call(this);

(function() {
  root.confirmBookingWindow.addEventListener('focus', function(e) {
    Ti.API.info("Paso 11 >>>>>>>>");
    if (root.bookingForFirstName === null) {
      root.bookingForEmail = root.user.email;
      root.bookingForFirstName = root.user.firstName;
      root.bookingForLastName = root.user.lastName;
      root.bookingForEmailLabel.text = root.user.email;
      root.bookingForNameLabel.text = root.user.firstName + ' ' + root.user.lastName;
    } else {
      root.bookingForNameLabel.text = root.bookingForFirstName + ' ' + root.bookingForLastName;
      root.bookingForEmailLabel.text = root.bookingForEmail;
    }
    if (Titanium.App.Properties.hasProperty("creditCard")) {
      root.creditCard = JSON.parse(Titanium.App.Properties.getString("creditCard"));
      root.cardTypeLabel.text = root.creditCard.type;
      root.cardNumberText.value = root.creditCard.number;
      root.cardNameText.value = root.creditCard.name;
      root.expiresLabel.text = root.creditCard.expire;
      root.cvcCodeText.value = root.creditCard.cvc;
    }
    root.priceLabel.text = root.totalPrice + ' €';
    if (root.bookingNights > 1) {
      root.totalLabel.text = L('total') + ' ' + root.bookingNights + ' ' + L('nights') + ':';
    } else {
      root.totalLabel.text = L('total') + ' 1 ' + L('night') + ':';
    }
    root.checkoutLabel.text = root.getLocaleDateString(root.checkoutDate);
    Ti.API.info("************** " + root.cardNumberText.value);
    if (root.cardNumberText.value === null || root.cardNumberText.value < 10) {
      Ti.API.info("************** ENTRA EN NO HAY TIPO DE TARJETA");
      root.paymentLabel.text = L('noPaymentInfo');
    } else {
      root.paymentLabel.text = L('creditCard') + ':  ' + root.cardTypeLabel.text + '   ' + root.cardNumberText.value;
    }
    return Ti.API.info("Sale bookingWindow focus >>>>>>>>");
  });
}).call(this);

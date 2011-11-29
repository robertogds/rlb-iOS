(function() {
  root.xhrBooking = Titanium.Network.createHTTPClient();
  root.xhrBooking.onload = function(e) {
    var response;
    Ti.API.info(this.responseText);
    Ti.API.info('_____________________ ENTRA EN COMPRA CON EXITO ********************');
    root.hideLoading(root.confirmBookingWindow);
    try {
      response = JSON.parse(this.responseText);
    } catch (error) {
      Ti.UI.createAlertDialog({
        title: 'ReallyLateBooking',
        message: L('errorBooking')
      }).show();
    }
    Ti.API.info(response);
    if (response.status === 201) {
      Ti.API.error('Paso 2');
      root.showOneBookingView(response.content);
      if (Titanium.Platform.name === 'android') {
        return root.confirmBookingWindow.add(root.oneClassBookingView);
      } else {
        Ti.API.error('Paso 3');
        root.oneBookingWindow.backButtonTitle = Ti.Locale.getString('close');
        root.oneBookingWindow.open({
          modal: true,
          modalTransitionStyle: Ti.UI.iPhone.MODAL_TRANSITION_STYLE_FLIP_HORIZONTAL,
          modalStyle: Ti.UI.iPhone.MODAL_PRESENTATION_FORMSHEET,
          navBarHidden: true
        });
        return root.oneBookingWindow.add(root.closeBookingButton);
      }
    } else {
      return Ti.UI.createAlertDialog({
        title: 'ReallyLateBooking',
        message: L('errorBooking')
      }).show();
    }
  };
  root.xhrBooking.onerror = function(e) {
    root.hideLoading(root.confirmBookingWindow);
    root.showError();
    return Ti.API.error(e);
  };
  root.doBooking = function() {
    var newBook, signature, url;
    Ti.API.info('_____________________ ENTRA EN COMPRAR ********************');
    root.showLoading(root.confirmBookingWindow);
    root.xhrBooking.setTimeout(15000);
    url = root.urlSignature('/booking');
    signature = root.doSignature(url);
    url = url + '/' + signature;
    root.xhrBooking.open("POST", root.surl + url);
    root.xhrBooking.setRequestHeader("Content-Type", "application/json; charset=utf-8");
    root.xhrBooking.setRequestHeader("Accept-Language", Titanium.Locale.currentLanguage);
    newBook = JSON.stringify({
      "userId": root.user.id,
      "dealId": root.deal.id,
      "nights": root.bookingNights,
      "creditCardType": root.cardTypeLabel.text,
      "creditCard": root.cardNumberText.value,
      "creditCardName": root.cardNameText.value,
      "creditCardExpiry": root.expiresLabel.text,
      "creditCardCVC": root.cvcCodeText.value,
      "bookingForEmail": root.bookingForEmail,
      "bookingForFirstName": root.bookingForFirstName,
      "bookingForLastName": root.bookingForLastName
    });
    Ti.API.info(newBook);
    Ti.API.info('Paso pre-compra');
    root.xhrBooking.send(newBook);
    return Ti.API.info('Paso post-compra');
  };
  root.validateBookingData = function() {
    if (!(root.user.id > 0)) {
      return Ti.Locale.getString('errorUser');
    }
    if (!(root.deal.id > 0)) {
      return Ti.Locale.getString('errorNoDeal');
    }
    if (root.cardTypeLabel.text === 'Tipo de tarjeta') {
      return Ti.Locale.getString('errorCardType');
    }
    if (!(root.cardTypeLabel.text.length > 2)) {
      return Ti.Locale.getString('errorCardType');
    }
    if (!(root.cardNumberText.value.length > 12)) {
      return Ti.Locale.getString('errorCardNumber');
    }
    if (!(root.cardNameText.value.length > 2)) {
      return Ti.Locale.getString('errorCardName');
    }
    if (!(root.expiresLabel.text.length > 2)) {
      return Ti.Locale.getString('errorExpires');
    }
    if (!(root.cvcCodeText.value.length > 2)) {
      return Ti.Locale.getString('errorcvcCode');
    }
    return true;
  };
}).call(this);

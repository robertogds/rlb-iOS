(function() {
  root.xhrBooking = Titanium.Network.createHTTPClient();
  root.xhrBooking.onload = function(e) {
    var response;
    Ti.API.info(this.responseText);
    root.confirmBookingWindow.remove(root.loadingView);
    response = JSON.parse(this.responseText);
    Ti.API.info(response);
    if (response.status === 201) {
      root.showOneBookingView(response.content);
      root.oneBookingWindow.backButtonTitle = Ti.Locale.getString('close');
      root.oneBookingWindow.open({
        modal: true,
        modalTransitionStyle: Ti.UI.iPhone.MODAL_TRANSITION_STYLE_FLIP_HORIZONTAL,
        modalStyle: Ti.UI.iPhone.MODAL_PRESENTATION_FORMSHEET,
        navBarHidden: true
      });
      return root.oneBookingWindow.add(root.closeBookingButton);
    } else {
      return alert('Error: ' + response.detail);
    }
  };
  root.xhrBooking.onerror = function(e) {
    root.confirmBookingWindow.remove(root.loadingView);
    alert(Ti.Locale.getString('errorHappened') + e);
    return Ti.API.error(e);
  };
  root.doBooking = function() {
    var newBook, signature, url;
    root.confirmBookingWindow.add(root.loadingView);
    root.xhrBooking.setTimeout(5000);
    url = root.urlSignature('/booking');
    signature = root.doSignature(url);
    url = url + '/' + signature;
    root.xhrBooking.open("POST", root.surl + url);
    root.xhrBooking.setRequestHeader("Content-Type", "application/json; charset=utf-8");
    root.xhrBooking.setRequestHeader("Accept-Language", Titanium.Locale.currentLanguage);
    newBook = JSON.stringify({
      "userId": root.user.id,
      "dealId": root.deal.id,
      "nights": "1",
      "creditCardType": root.cardTypeLabel.text,
      "creditCard": root.cardNumberText.value,
      "creditCardName": root.cardNameText.value,
      "creditCardExpiry": root.expiresLabel.text,
      "creditCardCVC": root.cvcCodeText.value
    });
    Ti.API.info(newBook);
    return root.xhrBooking.send(newBook);
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

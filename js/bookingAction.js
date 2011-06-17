(function() {
  root.xhrBooking = Titanium.Network.createHTTPClient();
  root.xhrBooking.onload = function(e) {
    var response;
    root.confirmBookingWindow.remove(root.loadingView);
    response = JSON.parse(this.responseText);
    Ti.API.info(response);
    if (response.status === 201) {
      root.showOneBookingView(response.content);
      root.oneBookingWindow.backButtonTitle = 'Cerrar';
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
    alert('Se ha producido un error ' + e);
    return Ti.API.error(e);
  };
  root.doBooking = function() {
    var newBook;
    root.confirmBookingWindow.add(root.loadingView);
    root.xhrBooking.setTimeout(5000);
    root.xhrBooking.open("POST", root.surl + "/booking");
    root.xhrBooking.setRequestHeader("Content-Type", "application/json; charset=utf-8");
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
    root.xhrBooking.send(newBook);
    return 1;
  };
}).call(this);

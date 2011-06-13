(function() {
  root.xhrBooking = Titanium.Network.createHTTPClient();
  root.xhrBooking.onload = function(e) {
    var response;
    alert('Entra en onload');
    response = JSON.parse(this.responseText);
    alert(response);
    Ti.API.info(response);
    if (response.status === 201) {
      return alert('correct');
    } else {
      return alert('Error: ' + response.detail);
    }
  };
  root.xhrBooking.onerror = function(e) {
    alert('sale por onerror' + e);
    return Ti.API.error(e);
  };
  root.doBooking = function() {
    var newBook;
    root.xhrBooking.setTimeout(5000);
    root.xhrBooking.open("POST", "http://rlb-back.appspot.com/booking");
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
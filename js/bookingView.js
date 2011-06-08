(function() {
  var cardNameRow, cardNameText, cardNumberRow, cardNumberText, cardTypeRow, cardTypeText, cvcCodeRow, cvcCodeText, expiresRow, expiresText;
  root.bookingView = Titanium.UI.createView({
    background: 'transparent',
    borderWidth: 0,
    width: 320,
    top: 0
  });
  root.bookingWindow.add(root.bookingView);
  root.creditCardTable = Titanium.UI.createTableView({
    top: 20,
    height: 175,
    width: 300,
    borderWidth: 0,
    borderRadius: 10,
    scrollable: false,
    moving: false
  });
  cardTypeText = Titanium.UI.createTextField({
    color: '#336699',
    hintText: 'Tipo de Tarjeta',
    clearOnEdit: true,
    paddingLeft: 10,
    returnKeyType: Titanium.UI.RETURNKEY_NEXT
  });
  cardTypeText.addEventListener('return', function(e) {
    return cardNumberText.focus();
  });
  cardNumberText = Titanium.UI.createTextField({
    color: '#336699',
    hintText: 'Número',
    clearOnEdit: true,
    paddingLeft: 10,
    returnKeyType: Titanium.UI.RETURNKEY_NEXT
  });
  cardNumberText.addEventListener('return', function(e) {
    return cardNameText.focus();
  });
  cardNameText = Titanium.UI.createTextField({
    color: '#336699',
    hintText: 'Titular',
    clearOnEdit: true,
    paddingLeft: 10,
    returnKeyType: Titanium.UI.RETURNKEY_NEXT
  });
  cardNameText.addEventListener('return', function(e) {
    return expiresText.focus();
  });
  expiresText = Titanium.UI.createTextField({
    color: '#336699',
    hintText: 'Expira',
    clearOnEdit: true,
    paddingLeft: 10,
    returnKeyType: Titanium.UI.RETURNKEY_NEXT
  });
  expiresText.addEventListener('return', function(e) {
    return cvcCodeText.focus();
  });
  cvcCodeText = Titanium.UI.createTextField({
    color: '#336699',
    hintText: 'Código CVC',
    paddingLeft: 10,
    clearOnEdit: true,
    passwordMask: true
  });
  cvcCodeText.addEventListener('return', function(e) {
    var cardName, cardType, creditNumber, cvcCode, expires;
    cardType = cardTypeText.value;
    creditNumber = creditNumberText.value;
    cardName = cardNameText.value;
    expires = expiresText.value;
    cvcCode = cvcCodeText.value;
    return 1;
  });
  root.creditCardSection = Titanium.UI.createTableViewSection();
  root.creditCardData = [];
  cardTypeRow = Titanium.UI.createTableViewRow();
  cardNumberRow = Titanium.UI.createTableViewRow();
  cardNameRow = Titanium.UI.createTableViewRow();
  expiresRow = Titanium.UI.createTableViewRow();
  cvcCodeRow = Titanium.UI.createTableViewRow();
  cardTypeRow.add(cardTypeText);
  cardNumberRow.add(cardNumberText);
  cardNameRow.add(cardNameText);
  expiresRow.add(expiresText);
  cvcCodeRow.add(cvcCodeText);
  root.creditCardSection.add(cardTypeRow);
  root.creditCardSection.add(cardNumberRow);
  root.creditCardSection.add(cardNameRow);
  root.creditCardSection.add(expiresRow);
  root.creditCardSection.add(cvcCodeRow);
  root.showBookingView = function() {
    if (root.userEmail !== null) {
      root.creditCardData[0] = root.creditCardSection;
      root.creditCardTable.data = root.creditCardData;
      root.bookingView.add(root.creditCardTable);
      root.bookingWindow.add(root.bookingView);
      root.tabGroup.activeTab.open(root.bookingWindow, {
        animated: true
      });
    } else {
      root.tabGroup.activeTab.open(root.accountWindow, {
        animated: true
      });
    }
    return 1;
  };
}).call(this);

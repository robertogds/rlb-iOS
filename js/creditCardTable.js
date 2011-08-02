(function() {
  var cardNameRow, cardNumberRow, cardTypeRow, cvcCodeRow, expiresRow;
  root.creditCardTable = Titanium.UI.createTableView({
    top: 15,
    height: 215,
    width: '95%',
    borderWidth: 0,
    borderRadius: 10,
    scrollable: false,
    moving: false,
    backgroundColor: '#fff'
  });
  root.cardTypeLabel = Titanium.UI.createLabel({
    color: '#afafaf',
    left: 11,
    text: L('cardType'),
    font: {
      fontSize: 17,
      fontFamily: 'Helvetica Neue'
    }
  });
  root.cardTypeLabel.addEventListener('click', function(e) {
    root.cardNameText.blur();
    root.cardNumberText.blur();
    root.cvcCodeText.blur();
    root.bookingView.add(root.cardTypeView);
    return root.cardTypeView.show();
  });
  root.cardNumberText = Titanium.UI.createTextField({
    width: '100%',
    color: '#336699',
    hintText: L('number'),
    clearOnEdit: false,
    paddingLeft: 10,
    keyboardType: Titanium.UI.KEYBOARD_NUMBERS_PUNCTUATION,
    returnKeyType: Titanium.UI.RETURNKEY_NEXT
  });
  root.cardNumberText.addEventListener('return', function(e) {
    return root.cardNameText.focus();
  });
  root.cardNameText = Titanium.UI.createTextField({
    width: '100%',
    color: '#336699',
    hintText: L('cardName'),
    clearOnEdit: false,
    paddingLeft: 10,
    returnKeyType: Titanium.UI.RETURNKEY_NEXT
  });
  root.cardNameText.addEventListener('return', function(e) {
    root.bookingView.add(root.expiresView);
    return root.expiresView.show();
  });
  root.cardExpiresMonth = '1';
  root.cardExpiresYear = '2011';
  root.cardType = 'Visa';
  root.expiresLabel = Titanium.UI.createLabel({
    left: 11,
    color: '#afafaf',
    text: L('expires'),
    font: {
      fontSize: 17,
      fontFamily: 'Helvetica Neue'
    }
  });
  root.expiresLabel.addEventListener('click', function(e) {
    root.cardNameText.blur();
    root.cardNumberText.blur();
    root.cvcCodeText.blur();
    root.bookingView.add(root.expiresView);
    return root.expiresView.show();
  });
  root.cvcCodeText = Titanium.UI.createTextField({
    width: '100%',
    color: '#336699',
    hintText: L('cvcCode'),
    paddingLeft: 10,
    clearOnEdit: false,
    keyboardType: Titanium.UI.KEYBOARD_NUMBERS_PUNCTUATION
  });
  root.cvcCodeText.addEventListener('return', function(e) {
    var validate;
    validate = root.validateBookingData();
    if (validate !== true) {
      return alert(L('reviewData') + ': ' + validate);
    }
  });
  root.creditCardSection = Titanium.UI.createTableViewSection();
  root.creditCardData = [];
  cardTypeRow = Titanium.UI.createTableViewRow();
  cardNumberRow = Titanium.UI.createTableViewRow();
  cardNameRow = Titanium.UI.createTableViewRow();
  expiresRow = Titanium.UI.createTableViewRow();
  cvcCodeRow = Titanium.UI.createTableViewRow();
  cardTypeRow.add(root.cardTypeLabel);
  cardNumberRow.add(root.cardNumberText);
  cardNameRow.add(root.cardNameText);
  expiresRow.add(root.expiresLabel);
  cvcCodeRow.add(root.cvcCodeText);
  root.creditCardSection.add(cardTypeRow);
  root.creditCardSection.add(cardNumberRow);
  root.creditCardSection.add(cardNameRow);
  root.creditCardSection.add(expiresRow);
  root.creditCardSection.add(cvcCodeRow);
}).call(this);

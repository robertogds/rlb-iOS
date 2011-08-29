root.creditCardTable = Titanium.UI.createTableView
  top: 15
  height: 220
  width: '95%'
  borderWidth:0
  borderRadius: 10
  scrollable: false
  moving: false
  backgroundColor: '#fff'

root.cardTypeLabel = Titanium.UI.createLabel
  width: '90%'
  color:'#afafaf'
  left: 11
  paddingLeft: 10
  text: L('cardType')
  font:{fontSize:17,fontFamily:'Helvetica Neue'}

root.cardTypeLabel.addEventListener 'click', (e) ->
  root.cardNameText.blur()
  root.cardNumberText.blur()
  root.cvcCodeText.blur()
  root.bookingView.add(root.cardTypeView)
  root.cardTypeView.show()

root.cardNumberText = Titanium.UI.createTextField
  backgroundColor: '#fff'
  width: '100%'
  color:'#336699'
  hintText: L('number')
  clearOnEdit: false
  paddingLeft: 10
  keyboardType: Titanium.UI.KEYBOARD_NUMBERS_PUNCTUATION 
  returnKeyType: Titanium.UI.RETURNKEY_NEXT

root.cardNumberText.addEventListener 'return', (e) ->
  root.cardNameText.focus()

root.cardNameText = Titanium.UI.createTextField
  backgroundColor: '#fff'
  width: '100%'
  color:'#336699'
  hintText: L('cardName')
  clearOnEdit: false
  paddingLeft: 10
  returnKeyType: Titanium.UI.RETURNKEY_NEXT

root.cardNameText.addEventListener 'return', (e) ->
  root.bookingView.add(root.expiresView)
  root.expiresView.show()

root.cardExpiresMonth = '1'
root.cardExpiresYear = '2011'
root.cardType = 'Visa'

root.expiresLabel = Titanium.UI.createLabel
  left: 11
  color:'#afafaf'
  text: L('expires')
  font:{fontSize:17,fontFamily:'Helvetica Neue'}

root.expiresLabel.addEventListener 'click', (e) ->
  root.cardNameText.blur()
  root.cardNumberText.blur()
  root.cvcCodeText.blur()
  root.bookingView.add(root.expiresView)
  root.expiresView.show()
  
root.cvcCodeText = Titanium.UI.createTextField
  backgroundColor: '#fff'
  width: '100%'
  color:'#336699'
  hintText: L('cvcCode')
  paddingLeft: 10
  clearOnEdit: false
  keyboardType: Titanium.UI.KEYBOARD_NUMBERS_PUNCTUATION

root.cvcCodeText.addEventListener 'return', (e) ->
  validate = root.validateBookingData()
  if validate isnt true
    Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:L('reviewData') + ': ' + validate}).show()

root.creditCardSection = Titanium.UI.createTableViewSection()
root.creditCardData = []
cardTypeRow = Titanium.UI.createTableViewRow
  width: '100%'
  height: 44
cardNumberRow = Titanium.UI.createTableViewRow
  width: '100%'
  height: 44
cardNameRow = Titanium.UI.createTableViewRow
  width: '100%'
  height: 44
expiresRow = Titanium.UI.createTableViewRow
  width: '100%'
  height: 44
cvcCodeRow = Titanium.UI.createTableViewRow
  width: '100%'
  height: 44

cardTypeRow.add(root.cardTypeLabel)
cardNumberRow.add(root.cardNumberText)
cardNameRow.add(root.cardNameText)
expiresRow.add(root.expiresLabel)
cvcCodeRow.add(root.cvcCodeText)

root.creditCardSection.add(cardTypeRow)
root.creditCardSection.add(cardNumberRow)
root.creditCardSection.add(cardNameRow)
root.creditCardSection.add(expiresRow)
root.creditCardSection.add(cvcCodeRow)

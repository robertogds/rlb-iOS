Ti.include(
  'js/confirmButton.js'
  'js/bookingAction.js'
  'js/expiresView.js'
  'js/cardTypeView.js'
)
root.bookingView = Titanium.UI.createView
  background: 'transparent'
  borderWidth: 0
  width:320
  top: 0
 root.bookingWindow.add(root.bookingView)

root.creditCardTable = Titanium.UI.createTableView
  top: 20
  height: 210
  width: 300
  borderWidth:0
  borderRadius: 10
  scrollable: false
  moving: false

root.cardTypeLabel = Titanium.UI.createLabel
  color:'#9e9e9e'
  text: '  Tipo de tarjeta'
  font:{fontSize:16,fontFamily:'Helvetica Neue'}

root.cardTypeLabel.addEventListener 'click', (e) ->
  root.bookingView.add(root.cardTypeView)
  root.cardTypeView.show()

root.cardNumberText = Titanium.UI.createTextField
  color:'#336699'
  hintText: 'Número'
  clearOnEdit: true
  paddingLeft: 10
  returnKeyType: Titanium.UI.RETURNKEY_NEXT

root.cardNumberText.addEventListener 'return', (e) ->
  root.cardNameText.focus()

root.cardNameText = Titanium.UI.createTextField
  color:'#336699'
  hintText: 'Titular'
  clearOnEdit: true
  paddingLeft: 10
  returnKeyType: Titanium.UI.RETURNKEY_NEXT

root.cardNameText.addEventListener 'return', (e) ->
  root.expiresText.focus()

root.cardExpiresMonth = '1'
root.cardExpiresYear = '2011'

root.expiresLabel = Titanium.UI.createLabel
  color:'#9e9e9e'
  text: '  Caduca en'
  font:{fontSize:16,fontFamily:'Helvetica Neue'}


root.expiresLabel.addEventListener 'click', (e) ->
  root.bookingView.add(root.expiresView)
  root.expiresView.show()
  
root.cvcCodeText = Titanium.UI.createTextField
  color:'#336699'
  hintText: 'Código CVC'
  paddingLeft: 10
  clearOnEdit: true
  passwordMask:true

root.cvcCodeText.addEventListener 'return', (e) ->
  1

root.creditCardSection = Titanium.UI.createTableViewSection()
root.creditCardData = []
cardTypeRow = Titanium.UI.createTableViewRow()
cardNumberRow = Titanium.UI.createTableViewRow()
cardNameRow = Titanium.UI.createTableViewRow()
expiresRow = Titanium.UI.createTableViewRow()
cvcCodeRow = Titanium.UI.createTableViewRow()

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


root.bookingView.add(root.confirmButton)


root.showBookingView = () ->
  if Titanium.App.Properties.hasProperty("user")
    root.creditCardData[0] = root.creditCardSection
    root.creditCardTable.data = root.creditCardData
    root.bookingView.add(root.creditCardTable)
    root.bookingWindow.add(root.bookingView)
    root.tabGroup.activeTab.open(root.bookingWindow,{animated:true})
  else
    root.tabGroup.activeTab.open(root.accountWindow,{animated:true})
  1
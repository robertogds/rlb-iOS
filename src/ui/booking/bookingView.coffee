root.bookingView = Titanium.UI.createView
  background: 'transparent'
  borderWidth: 0
  width:320
  top: 0
 root.bookingWindow.add(root.bookingView)

root.creditCardTable = Titanium.UI.createTableView
  top: 20
  height: 175
  width: 300
  borderWidth:0
  borderRadius: 10
  scrollable: false
  moving: false

cardTypeText = Titanium.UI.createTextField
  color:'#336699'
  hintText: 'Tipo de Tarjeta'
  clearOnEdit: true
  paddingLeft: 10
  returnKeyType: Titanium.UI.RETURNKEY_NEXT

cardTypeText.addEventListener 'return', (e) ->
  cardNumberText.focus()

cardNumberText = Titanium.UI.createTextField
  color:'#336699'
  hintText: 'Número'
  clearOnEdit: true
  paddingLeft: 10
  returnKeyType: Titanium.UI.RETURNKEY_NEXT

cardNumberText.addEventListener 'return', (e) ->
  cardNameText.focus()

cardNameText = Titanium.UI.createTextField
  color:'#336699'
  hintText: 'Titular'
  clearOnEdit: true
  paddingLeft: 10
  returnKeyType: Titanium.UI.RETURNKEY_NEXT

cardNameText.addEventListener 'return', (e) ->
  expiresText.focus()

expiresText = Titanium.UI.createTextField
  color:'#336699'
  hintText: 'Expira'
  clearOnEdit: true
  paddingLeft: 10
  returnKeyType: Titanium.UI.RETURNKEY_NEXT

expiresText.addEventListener 'return', (e) ->
  cvcCodeText.focus()


cvcCodeText = Titanium.UI.createTextField
  color:'#336699'
  hintText: 'Código CVC'
  paddingLeft: 10
  clearOnEdit: true
  passwordMask:true

cvcCodeText.addEventListener 'return', (e) ->
  cardType = cardTypeText.value
  creditNumber = creditNumberText.value
  cardName = cardNameText.value
  expires = expiresText.value
  cvcCode = cvcCodeText.value
  #root.doRegister(email,password,firstName,lastName)
  1

root.creditCardSection = Titanium.UI.createTableViewSection()
root.creditCardData = []
cardTypeRow = Titanium.UI.createTableViewRow()
cardNumberRow = Titanium.UI.createTableViewRow()
cardNameRow = Titanium.UI.createTableViewRow()
expiresRow = Titanium.UI.createTableViewRow()
cvcCodeRow = Titanium.UI.createTableViewRow()

cardTypeRow.add(cardTypeText)
cardNumberRow.add(cardNumberText)
cardNameRow.add(cardNameText)
expiresRow.add(expiresText)
cvcCodeRow.add(cvcCodeText)

root.creditCardSection.add(cardTypeRow)
root.creditCardSection.add(cardNumberRow)
root.creditCardSection.add(cardNameRow)
root.creditCardSection.add(expiresRow)
root.creditCardSection.add(cvcCodeRow)


root.showBookingView = () ->
  if root.userEmail isnt null 
    root.creditCardData[0] = root.creditCardSection
    root.creditCardTable.data = root.creditCardData
    root.bookingView.add(root.creditCardTable)
    root.bookingWindow.add(root.bookingView)
    root.tabGroup.activeTab.open(root.bookingWindow,{animated:true})
  else
    root.tabGroup.activeTab.open(root.accountWindow,{animated:true})
  1
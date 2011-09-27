root.paymentView = Titanium.UI.createView
  backgroundColor:'#0d1e28'
  width: Ti.Platform.displayCaps.platformWidth

infoImage = Titanium.UI.createImageView 
  top: 240
  image: '/images/icon_info.png'
  width: 20
  height: 20
  left: 2
root.paymentView.add(infoImage)

adviseCardLabel = Titanium.UI.createLabel
  borderWidth: 0
  borderColor: '#0d1e28'
  height: 60
  top: 240
  text: L('adviceCard')
  color: '#fff'
  left: 22
  font:
    fontSize: 12
    fontWeight: 'bold'

root.paymentView.add(adviseCardLabel)

savePaymentButton = new root.GenericButton(310,L('save')).button
root.paymentView.add(savePaymentButton)

savePaymentButton.addEventListener 'click', (e) ->
  validate = root.validateBookingData()
  if validate isnt true
    Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:L('reviewData') + ': ' + validate}).show()
  else
    creditCard = JSON.stringify
      "type": root.cardTypeLabel.text
      "number": root.cardNumberText.value
      "name": root.cardNameText.value
      "expire": root.expiresLabel.text
      "cvc": root.cvcCodeText.value
    Titanium.App.Properties.setString("creditCard",creditCard)
    root.paymentWindow.close()

root.creditCardData[0] = root.creditCardSection
root.creditCardTable.data = root.creditCardData
root.paymentView.add(root.creditCardTable)
root.paymentWindow.add(root.paymentView)
root.confirmBookingWindow.addEventListener 'focus', (e) ->
  if root.bookingForFirstName is undefined
    root.bookingForEmail = root.user.email
    root.bookingForFirstName = root.user.firstName
    root.bookingForLastName = root.user.lastName
    root.bookingForEmailLabel.text = root.user.email
    root.bookingForNameLabel.text = root.user.firstName + ' ' + root.user.lastName
  else
    root.bookingForNameLabel.text = root.bookingForFirstName + ' ' + root.bookingForLastName
    root.bookingForEmailLabel.text = root.bookingForEmail
  if Titanium.App.Properties.hasProperty("creditCard")
    root.creditCard = JSON.parse(Titanium.App.Properties.getString("creditCard"))
    root.cardTypeLabel.text = root.creditCard.type
    root.cardNumberText.value = root.creditCard.number
    root.cardNameText.value = root.creditCard.name
    root.expiresLabel.text = root.creditCard.expire
    root.cvcCodeText.value = root.creditCard.cvc
  root.priceLabel.text = root.totalPrice + ' €'
  if root.bookingNights > 1
    root.totalLabel.text = L('total') + ' ' + root.bookingNights + ' ' + L('nights') + ':' 
  else
    root.totalLabel.text = L('total') + ' 1 ' + L('night') + ':'
  root.checkoutLabel.text = root.getLocaleDateString(root.checkoutDate)
  if root.cardTypeLabel.text is 'Tipo de tarjeta'
    root.paymentLabel.text = L('noPaymentInfo')
  else root.paymentLabel.text = L('creditCard') + ':  ' + root.cardTypeLabel.text + '   ' + root.cardNumberText.value



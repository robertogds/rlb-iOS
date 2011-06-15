root.xhrBooking = Titanium.Network.createHTTPClient()

root.xhrBooking.onload = (e) ->
  response = JSON.parse(this.responseText)
  Ti.API.info(response)
  if response.status is 201
    root.showOneBookingView(response.content)
    root.oneBookingWindow.backButtonTitle = 'Cerrar'  
    root.oneBookingWindow.open
      modal:true
      modalTransitionStyle: Ti.UI.iPhone.MODAL_TRANSITION_STYLE_FLIP_HORIZONTAL,
      modalStyle: Ti.UI.iPhone.MODAL_PRESENTATION_FORMSHEET
      navBarHidden:true
    root.oneBookingWindow.add(root.closeBookingButton)
  else
    alert 'Error: ' + response.detail

root.xhrBooking.onerror = (e) ->
  alert('Se ha producido un error ' + e)
  Ti.API.error(e)

root.doBooking = () ->
  root.xhrBooking.setTimeout(5000)
  root.xhrBooking.open("POST","http://rlb-back.appspot.com/booking")
  root.xhrBooking.setRequestHeader("Content-Type","application/json; charset=utf-8")
  newBook = JSON.stringify
    "userId": root.user.id
    "dealId": root.deal.id
    "nights": "1"
    "creditCardType": root.cardTypeLabel.text
    "creditCard" : root.cardNumberText.value
    "creditCardName": root.cardNameText.value
    "creditCardExpiry": root.expiresLabel.text
    "creditCardCVC": root.cvcCodeText.value
  Ti.API.info(newBook)
  root.xhrBooking.send(newBook)
  1
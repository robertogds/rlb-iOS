root.xhrBooking = Titanium.Network.createHTTPClient()

root.xhrBooking.onload = (e) ->
  Ti.API.info this.responseText
  root.confirmBookingWindow.remove(root.loadingView)
  response = JSON.parse(this.responseText)
  Ti.API.info(response)
  if response.status is 201
    root.showOneBookingView(response.content)
    root.oneBookingWindow.backButtonTitle = Ti.Locale.getString('close') 
    root.oneBookingWindow.open
      modal:true
      modalTransitionStyle: Ti.UI.iPhone.MODAL_TRANSITION_STYLE_FLIP_HORIZONTAL,
      modalStyle: Ti.UI.iPhone.MODAL_PRESENTATION_FORMSHEET
      navBarHidden:true
    root.oneBookingWindow.add(root.closeBookingButton)
  else
    alert 'Error: ' + response.detail

root.xhrBooking.onerror = (e) ->
  root.confirmBookingWindow.remove(root.loadingView)
  alert(Ti.Locale.getString('errorHappened') + e)
  Ti.API.error(e)

root.doBooking = () ->
  root.confirmBookingWindow.add(root.loadingView)
  root.xhrBooking.setTimeout(5000)
  root.xhrBooking.open("POST",root.surl+"/booking")
  root.xhrBooking.setRequestHeader("Content-Type","application/json; charset=utf-8")
  root.xhrBooking.setRequestHeader("Accept-Language",Titanium.Locale.currentLanguage)
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


root.validateBookingData = () ->
  return 'Usuario incorrecto' unless root.user.id > 0
  return 'No hay deal' unless root.deal.id > 0
  return 'Tipo de tarjeta incorrecto' if root.cardTypeLabel.text is 'Tipo de tarjeta'
  return 'Tipo de tarjeta incorrecto' unless root.cardTypeLabel.text.length > 2
  return 'Número de tarjeta incorrecto' unless root.cardNumberText.value.length > 12
  return 'Titular tarjeta incorrecto' unless root.cardNameText.value.length > 2
  return 'Fecha expiración incorrecta' unless root.expiresLabel.text.length > 2
  return 'cvcCode incorrecto' unless root.cvcCodeText.value.length > 2
  return true 
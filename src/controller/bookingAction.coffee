root.xhrBooking = Titanium.Network.createHTTPClient()

root.xhrBooking.onload = (e) ->
  alert 'Entra en onload'
  response = JSON.parse(this.responseText)
  alert response
  if response.status is 201
    newUser = response.content
    root.doLogin(newUser.email,newUser.password)
    #root.tabGroup.activeTab.open(root.accountWindow,{animated:true})
    root.newAccountWindow.close()
  else
    alert 'Error: ' + response.detail

root.xhrBooking.onerror = (e) ->
  alert('sale por onerror' + e)
  Ti.API.error(e)

root.doBooking = () ->
  root.xhrBooking.setTimeout(5000)
  root.xhrBooking.open("POST","http://rlb-back.appspot.com/booking")
  root.xhrBooking.setRequestHeader("Content-Type","application/json; charset=utf-8")
  newBook = JSON.stringify
    "userId": root.user.id
    "dealId": root.deal.id
    "nights": "1"
    "creditCardType": root.cardTypeText.value
    "creditCard" : root.cardNumberText.value
    "creditCardName": root.cardNameText.value
    "creditCardExpiry": root.expiresLabel.text
    "creditCardCVC": root.cvcCodeText.value
  Ti.API.info(newBook)
  root.xhrBooking.send(newBook)
  1
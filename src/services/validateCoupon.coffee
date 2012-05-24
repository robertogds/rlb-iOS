root.xhrValidateCoupon = Titanium.Network.createHTTPClient()
root.xhrValidateCoupon.setTimeout(15000)

root.xhrValidateCoupon.onload = (e) ->
	Ti.API.info this.responseText
	Ti.API.info '_____________________ COUPON VALIDADO CON EXITO ********************'
	root.hideLoading(root.creditsWindow)
	try
		response = JSON.parse(this.responseText)
	catch error
		Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:L('errorBooking')}).show()
	Ti.API.info(response)
	if response.status is 201
		alert 'El cupon se validó OK'
		root.fetchCreditsConnect()
	else
		Ti.API.error 'error de compra'
		Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:'Error: ' + response.detail}).show()

root.xhrValidateCoupon.onerror = (e) ->
	root.hideLoading(root.creditsWindow)
	root.showError()
	Ti.API.error(e)

root.validateCoupon = (code) ->
	Ti.API.info '_____________________ ENTRA EN VALIDAR COUPON ********************'
	url = root.urlSignature('/coupon')
	signature = root.doSignature(url)
	url = url + '/' + signature
	root.xhrValidateCoupon.open("POST",root.surl+url)
	root.xhrValidateCoupon.setRequestHeader("Content-Type","application/json; charset=utf-8")
	root.xhrValidateCoupon.setRequestHeader("Accept-Language",Titanium.Locale.currentLanguage)
	
	user = {}
	user.id = root.user.id

	newCoupon = JSON.stringify
		"user": user
		"key": code
	Ti.API.info(newCoupon)
	Ti.API.info 'Paso pre-compra'
	root.xhrValidateCoupon.send(newCoupon)
	Ti.API.info 'Paso post-compra'


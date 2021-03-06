root.newCouponView = Titanium.UI.createView
	height:80
	borderWidth:0
	boderColor: 'grey'
	top: 0

root.codeText = Titanium.UI.createTextField
	backgroundColor: '#fff'
	#autocapitalization: Ti.UI.TEXT_AUTOCAPITALIZATION_ALL
	top: 37
	left: 140
	width: 120
	height: 20
	borderRadius: 8
	color:'#336699'
	hintText: 'Code'
	clearOnEdit: true
	paddingLeft: 10
	returnKeyType: Titanium.UI.RETURNKEY_DONE

root.codeText.addEventListener 'return', (e) ->
	Ti.API.info 'Entra en return validar con code = ' + root.codeText.value
	root.showLoading(root.creditsWindow)
	root.validateCoupon(root.codeText.value)

introCodeTitle = new root.GenericBlueTitleLabel(5,10,L('have_coupon_code') ).label
introCode = new root.GenericTextLabel(40,10,L('enter_code')).label


root.newCouponView.add(introCodeTitle)
root.newCouponView.add(introCode)
root.newCouponView.add(root.codeText)
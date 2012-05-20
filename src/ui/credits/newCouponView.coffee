root.newCouponView = Titanium.UI.createView
	height:80
	borderWidth:1
	boderColor: 'grey'
	top: 0

codeText = Titanium.UI.createTextField
	backgroundColor: '#fff'
	top: 37
	left: 120
	width: 120
	height: 20
	borderRadius: 8
	color:'#336699'
	hintText: 'Code'
	clearOnEdit: true
	paddingLeft: 10
	returnKeyType: Titanium.UI.RETURNKEY_DONE

introCodeTitle = new root.GenericTitleLabel(0,10,'Do you have a new coupon code?' ).label
introCode = new root.GenericTextLabel(40,10,'Enter code'+ ': ').label


root.newCouponView.add(introCodeTitle)
root.newCouponView.add(introCode)
root.newCouponView.add(codeText)
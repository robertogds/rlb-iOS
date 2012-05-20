root.balanceView = Titanium.UI.createView
	height:80
	borderWidth:1
	boderColor: 'grey'
	top: 80

balanceTitle = new root.GenericTitleLabel(25,10,'Your balance:' ).label

balanceLabel = Titanium.UI.createLabel
	text: '195 €'
	width: Ti.UI.FILL
	textAlign: 'right'
	right: 20
	height: 40
	top: 20
	color: 'white'
	font:
		fontSize: 32
		fontWeight: 'bold'

root.balanceView.add(balanceTitle)
root.balanceView.add(balanceLabel)


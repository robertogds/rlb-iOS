root.balanceView = Titanium.UI.createView
	height:80
	borderWidth:1
	backgroundColor:'black'
	borderColor: '#2c2c2c'
	top: 80



balanceTitle2 = Titanium.UI.createLabel
	top:25
	height: Ti.UI.SIZE
	text: L('your_balance') + ': '
	color: '#868d92'
	font:
		fontSize: 22
		fontWeight: 'bold'
	left: 10

balanceTitle = new root.GenericBlueTitleLabel(25,10,L('your_balance') ).label

root.balanceLabel = Titanium.UI.createLabel
	text: ''
	width: Ti.UI.FILL
	textAlign: 'right'
	right: 30
	height: Ti.UI.SIZE
	top: 20
	color: 'white'
	font:
		fontSize: 32
		fontWeight: 'bold'

root.balanceView.add(balanceTitle2)
root.balanceView.add(root.balanceLabel)


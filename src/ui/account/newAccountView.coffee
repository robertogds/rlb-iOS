Ti.include(
	'/js/newAccountAction.js'
	'/js/newAccountTable.js'
)

root.newAccountView = Titanium.UI.createView
  backgroundColor: 'transparent'
  width:'100%'

newAccountLabel = Titanium.UI.createLabel
	text: L('orRegisterLabel')+':'
	textAlign: 'center'
	color: '#fff'
	font:
		fontSize: 14
		fontWeight: 'bold'
	height: 30
	top: 55

acceptLegalLabel = Titanium.UI.createLabel
  borderWidth: 0
  top: 330
  color: "#fff"
  text: Ti.Locale.getString('acceptTerms')
  left: 8
  font:
    fontSize: 10
    #fontWeight: 'bold'

root.newAccountView.add(root.facebookRegisterButton)
root.newAccountView.add(newAccountLabel)
root.newAccountView.add(acceptLegalLabel)
root.newAccountView.add(root.newAccountButton)


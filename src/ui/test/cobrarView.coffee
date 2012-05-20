root.cantidadText = Titanium.UI.createTextField
	backgroundColor: '#fff'
	width: '90'
	height: '30'
	color:'#336699'
	hintText: 'Cantidad'
	clearOnEdit: false
	paddingLeft: 10
	returnKeyType: Titanium.UI.RETURNKEY_NEXT

root.cobrarWindow.add(root.zoozButton)
root.cobrarWindow.add(root.cantidadText)
class GenericBlueTitleLabel
	constructor: (top,left,text) ->
		@label = Titanium.UI.createLabel
			text: text
			width: Ti.UI.FILL
			textAlign: 'left'
			height: Ti.UI.SIZE
			left: left
			top: top
			color: '#0098CB'
			font:
				fontSize: 16
				fontWeight: 'bold'
		
root.GenericBlueTitleLabel = GenericBlueTitleLabel
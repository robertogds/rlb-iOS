class GenericTextLabel
	constructor: (top,left,text) ->
		@label = Titanium.UI.createLabel
			text: text
			width: Ti.UI.FILL
			textAlign: 'left'
			height: Ti.UI.SIZE
			left: left
			top: top
			color: '#fff'
			font:
				fontSize: 12
				fontWeight: 'bold'
		
root.GenericTextLabel = GenericTextLabel
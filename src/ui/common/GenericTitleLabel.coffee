class GenericTitleLabel
	constructor: (top,text) ->
		@label = Titanium.UI.createLabel
			text: text
			width: Ti.UI.FILL
			textAlign: 'left'
			height: 30
			left: 10
			top: top
			color: '#0098CB'
			font:
				fontSize: 16
				fontWeight: 'bold'
		
root.GenericTitleLabel = GenericTitleLabel
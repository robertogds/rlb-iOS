class GenericSubtitleLabel
	constructor: (top,left,text) ->
		@label = Titanium.UI.createLabel
			text: text
			width: Ti.UI.FILL
			left: left
			textAlign: 'left'
			height: Ti.UI.SIZE
			top: top
			color: '#858C92'
			font:
				fontSize: 14
				#fontWeight: 'bold'
		
root.GenericSubtitleLabel = GenericSubtitleLabel
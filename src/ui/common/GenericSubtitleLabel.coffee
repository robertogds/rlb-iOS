class GenericSubtitleLabel
	constructor: (top,text) ->
		@label = Titanium.UI.createLabel
			text: text
			width: Ti.UI.FILL
			left: 10
			textAlign: 'left'
			height: 30
			top: top
			color: '#858C92'
			font:
				fontSize: 12
				#fontWeight: 'bold'
		
root.GenericSubtitleLabel = GenericSubtitleLabel
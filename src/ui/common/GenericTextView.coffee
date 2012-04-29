class GenericTextView
	constructor: (top,title,text) ->
		@view = Titanium.UI.createView
			#backgroundColor: '#0d1e28'
			backgroundImage: '/images/Texture.jpg'
			borderWidth: 0
			width: Ti.UI.FILL
			height: Ti.UI.FILL
			top: top
		
		@titleLabel = Titanium.UI.createLabel
			text: title
			height: 30
			top: 20
			color: '#fff'
			left: 10
			font:
				fontSize: 20
				fontWeight: 'bold'
	
		@textLabel = Titanium.UI.createLabel
			text: text + '\n\n'
			borderWidth: 0
			top: 60
			#height: Ti.UI.FILL
			color: '#fff'
			left: 10
			right: 10
			font:
				fontSize: 14
		
		@view.add(@titleLabel)
		@view.add(@textLabel)
		
root.GenericTextView = GenericTextView
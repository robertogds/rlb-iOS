class GenericTextView
	constructor: (top,title,text) ->
		@view = Titanium.UI.createView
			#backgroundColor: '#0d1e28'
			backgroundImage: '/images/Texture.jpg'
			borderWidth: 0
			width: Ti.UI.FILL
			height: Ti.UI.SIZE
			top: top
		
		@titleLabel = Titanium.UI.createLabel
			text: title
			height: Ti.UI.SIZE
			top: 20
			color: '#fff'
			left: 10
			font:
				fontSize: 24
				fontWeight: 'bold'
	
		@textLabel = Titanium.UI.createLabel
			text: text + '\n\n'
			borderWidth: 0
			top: 80
			height: Ti.UI.SIZE
			color: '#fff'
			left: 10
			right: 10
			font:
				fontSize: 14
				fontWeight: 'bold'
		
		@view.add(@titleLabel)
		@view.add(@textLabel)
		
root.GenericTextView = GenericTextView
class CityHeaderView
	constructor: (texto) ->
		@view = Titanium.UI.createView
			width: Ti.UI.FILL
			height: 25
		
		textLabel = Titanium.UI.createLabel
			width: Ti.UI.FILL
			text: texto 
			textAlign: 'left'
			borderWidth: 0
			height: 20
			color: '#fff'
			left: 10
			font:
				fontSize: 14
				fontWeight: 'bold'
					
		headerBarLabel = Titanium.UI.createLabel
			width: Ti.UI.FILL
			backgroundGradient:
				type:'linear'
				colors:[{color:'#7a92a0',position:0.1},{color:'#a5c4d6',position:1}]
			opacity: 0.7
			color: '#fff'
			height: 25
			top: 0
		
		@view.add(headerBarLabel)
		@view.add(textLabel)
		
root.CityHeaderView = CityHeaderView
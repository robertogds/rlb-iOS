class CityHeaderView
	constructor: (texto) ->
		@view = Titanium.UI.createView
			width: Ti.UI.FILL
			height: 15
		
		textLabel = Titanium.UI.createLabel
			width: Ti.UI.FILL
			text: texto 
			textAlign: 'left'
			borderWidth: 0
			height: 20
			color: '#060426'
			left: 10
			font:
				fontSize: 12
				fontWeight: 'bold'
					
		headerBarLabel = Titanium.UI.createLabel
			width: Ti.UI.FILL
			backgroundGradient:
				type:'linear'
				colors:[{color:'#fefdc2',position:0.1},{color:'#fdfddf',position:1}]
			opacity: 0.7
			color: '#fff'
			height: 25
			top: 0
		
		@view.add(headerBarLabel)
		@view.add(textLabel)
		
root.CityHeaderView = CityHeaderView
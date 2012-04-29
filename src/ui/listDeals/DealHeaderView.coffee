class DealHeaderView
	constructor: (text) ->
		@view = Titanium.UI.createView
			width: Ti.UI.FILL
			#backgroundColor: '#5093b0'
			height: 25
		
		@textLabel = Titanium.UI.createLabel
			width: Ti.UI.FILL
			text: text 
			textAlign: 'center'
			backgroundColor: 'transparent'
			borderWidth: 0
			height: 20
			color: '#fff'
			left: 10
			font:
				fontSize: 14
				fontWeight: 'bold'
				
		headerBarLabel = Titanium.UI.createLabel
			width: Ti.UI.FILL
			borderWidth: 1
			borderColor: 'black'
			backgroundGradient:
		        type:'linear'
		        colors:[{color:'#000000',position:0.1},{color:'#2b5060',position:0.2},{color:'#5093b0',position:1}]
			opacity: 0.7
			color: '#fff'
			height: 25
			top: 0
		
		@view.add(headerBarLabel)
		@view.add(@textLabel)

root.dealHeaderView = DealHeaderView
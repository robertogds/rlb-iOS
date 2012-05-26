class GenericPayButton
	constructor: (top,text) ->
		@label = Titanium.UI.createLabel
			backgroundImage: '/images/booking_background.png'
			borderWidth:1
			borderColor: '#0098cb'
			color: '#000'
			width: 300
			height: 40
			borderRadius: 5
			backgroundColor: '#0098cb'
			text: text
			textAlign: 'center'
			font:
				fontSize: 18
				fontWeight: 'bold'
				fontFamily:'Helvetica Neue'
			top: top
root.GenericPayButton = GenericPayButton
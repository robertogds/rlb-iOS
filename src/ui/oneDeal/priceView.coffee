root.priceView = Titanium.UI.createView
  backgroundColor: 'transparent'
  width:'100%'
  top: 265
  height: 65

barPriceView = Titanium.UI.createView
	backgroundColor: 'black'
	opacity: '0.8'
	top:0
	height: 65
root.priceView.add(barPriceView)

root.oneDealPriceLabel = Titanium.UI.createLabel
  width: 85
  height: 40
  textAlign: 'left'
  color: '#fff'
  font:
    fontSize: 36
    fontWeight: 'bold'
    fontFamily:'Helvetica Neue'
  #top: '10'
  left: 15

root.oneDealNormalPriceLabel = Titanium.UI.createLabel
  width: 77
  height: 22
  textAlign: 'left'
  color: '#868d92'
  font:
    fontSize: 20
    fontWeight: 'bold'
    fontFamily:'Helvetica Neue'
  top: 28
  left: 110

sepVertView = Titanium.UI.createView
  backgroundColor: '#444547' 
  left: 105
  #top: '34%'
  height: 28
  width: 1

antesLabel = Titanium.UI.createLabel
  text: L('before')
  color: '#868d92'
  left: 110
  font:
    fontSize: 14
  width: 40
  height: 25
  top: 10

root.bookingButtonLabel = Titanium.UI.createLabel
	backgroundImage: '/images/booking_background.png'
	borderWidth:1
	borderColor: '#0098cb'
	color: '#000'
	width: 120
	height: 35
	borderRadius: 5
	backgroundColor: '#0098cb'
	#text: L('bookingBlueButtonText') + '     '
	text: 'Reservar    '
	textAlign: 'center'
	font:
		fontSize: 18
		fontWeight: 'bold'
		fontFamily:'Helvetica Neue'
	#top: '30%'
	left: 180

root.bookingButtonLabel.addEventListener 'click', (e) ->
	root.showBookingView() 

root.soldOutLabel = Titanium.UI.createLabel
	width: 280
	height: 30
	borderRadius: 5
	backgroundColor: '#000000'
	text: L('soldOut')
	color: '#ff0000'
	font:
		fontSize: 18
		fontWeight: 'bold'
		fontFamily:'Helvetica Neue'
	#top: '40%'
	left: '60%'

root.priceView.add(root.oneDealPriceLabel)
root.priceView.add(root.oneDealNormalPriceLabel)
root.priceView.add(sepVertView)
root.priceView.add(antesLabel)

root.priceView.add(root.bookingButtonLabel)
root.priceView.add(root.soldOutLabel)
root.soldOutLabel.hide()

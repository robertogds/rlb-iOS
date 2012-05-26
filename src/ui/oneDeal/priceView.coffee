root.priceView = Titanium.UI.createView
  backgroundColor: 'transparent'
  width:'100%'
  top: 265
  height: 65

root.shareTwitterImage = Titanium.UI.createImageView 
	top: 0
	width: 40
	height: 37
	left: 170
	image: '/images/share_twitter2.png'

root.shareFacebookImage = Titanium.UI.createImageView 
	top: 0
	width: 40 
	height: 37
	left: 220
	image: '/images/share_facebook2.png'


root.shareEmailImage = Titanium.UI.createImageView 
	top: 0
	width: 40
	height: 37
	left: 270
	image: '/images/share_mail.png'


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

root.bookingButtonLabel = new root.GenericPayButton(335,L('bookingBlueButtonText')).label

root.bookingButtonLabel.addEventListener 'click', (e) ->
	root.showLoading(root.oneDealWindow)
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

root.priceView.add(root.shareFacebookImage)
root.priceView.add(root.shareTwitterImage)
root.priceView.add(root.shareEmailImage)
root.priceView.add(root.oneDealPriceLabel)
root.priceView.add(root.oneDealNormalPriceLabel)
root.priceView.add(sepVertView)
root.priceView.add(antesLabel)

#root.priceView.add(root.bookingButtonLabel)
root.priceView.add(root.soldOutLabel)
root.soldOutLabel.hide()

root.priceView = Titanium.UI.createView
  backgroundColor: 'transparent'
  width:'100%'
  top: 230
  height: 50

barPriceView = Titanium.UI.createView
	backgroundColor: 'black'
	opacity: '0.7'
	top:0
	height: 50
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
  top: '20'
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
  height: 20
  top: '2'

root.shareFacebookImage = Titanium.UI.createImageView 
	top: 8
	width: 40 
	height: 37
	left: 170
	image: '/images/share_facebook2.png'

root.shareTwitterImage = Titanium.UI.createImageView 
	top: 8
	width: 40
	height: 37
	left: 220
	image: '/images/share_twitter2.png'

root.shareEmailImage = Titanium.UI.createImageView 
	top: 8
	width: 40
	height: 37
	left: 270
	image: '/images/share_mail.png'

root.priceView.add(root.shareFacebookImage)
root.priceView.add(root.shareTwitterImage)
root.priceView.add(root.shareEmailImage)
root.priceView.add(root.oneDealPriceLabel)
root.priceView.add(root.oneDealNormalPriceLabel)
root.priceView.add(sepVertView)
root.priceView.add(antesLabel)

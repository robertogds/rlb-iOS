priceContainerView = Titanium.UI.createView
  width: '100%'
  top: 120
  height: '24%'

priceView = Titanium.UI.createView
  backgroundColor: 'black'
  width:'100%'
  top: 0
  height: 77

root.infoHotelIpadLabel = Titanium.UI.createLabel
  width:'100%'
  color: 'white'
  font:
    fontSize: 14
    fontWeight: 'normal'
    fontFamily:'Helvetica Neue'
  top: 80
  height: 110
  left: 25

#priceContainerView.add(root.infoHotelIpadLabel)

root.oneDealPriceLabel = Titanium.UI.createLabel
  width: 85
  height: 40
  textAlign: 'left'
  color: '#fff'
  font:
    fontSize: 36
    fontWeight: 'bold'
    fontFamily:'Helvetica Neue'
  top: '25%'
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
  top: '47%'
  left: 110

priceView.add(root.oneDealPriceLabel)
priceView.add(root.oneDealNormalPriceLabel)

sepVertView = Titanium.UI.createView
  backgroundColor: '#444547' 
  left: 105
  top: '34%'
  height: 28
  width: 1

priceView.add(sepVertView)

antesLabel = Titanium.UI.createLabel
  text: L('before')
  color: '#868d92'
  left: 110
  font:
    fontSize: 16
  width: 40
  height: 20
  top: '24%'
priceView.add(antesLabel)

root.bookingLabel = Titanium.UI.createLabel
  backgroundImage: '/images/booking_background.png'
  borderWidth:1
  borderColor: '#0098cb'
  width: 108
  height: 33
  borderRadius: 5
  backgroundColor: '#0098cb'
  text: ' '+L('bookingBlueButtonText')
  font:
    fontSize: 18
    fontWeight: 'bold'
    fontFamily:'Helvetica Neue'
  top: '30%'
  left: '60%'

root.bookingLabel.addEventListener 'click', (e) ->
  root.showBookingView() 

root.soldOutLabel = Titanium.UI.createLabel
  width: 108
  height: 33
  borderRadius: 5
  backgroundColor: '#000000'
  text: L('soldOut')
  color: '#ff0000'
  font:
    fontSize: 18
    fontWeight: 'bold'
    fontFamily:'Helvetica Neue'
  top: '40%'
  left: '60%'

#priceView.add(root.soldOutLabel)
#root.soldOutLabel.hide()
priceView.add(root.bookingLabel)
priceContainerView.add(priceView) 
root.priceView = priceContainerView
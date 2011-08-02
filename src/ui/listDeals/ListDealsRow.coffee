class ListDealsRow
  constructor: (deal) ->
    @row = Ti.UI.createTableViewRow
      hasChild: true
      rightImage: '/images/blue_arrow.png'
      identionLevel: 200
      height: 120
      backgroundGradient:
        type:'linear'
        colors:[{color:'#07151d',position:0.1},{color:'#0d1e28',position:1.0}]
      fontSize: 6
      deal: deal
      color: '#fff'

    image = Titanium.UI.createImageView 
      image: deal.mainImageSmall
      borderRadius: 10
      borderColor: '#fff'
      borderWidth: 2
      left: 4
      width: 140
      height: 110
    @row.add(image)

    hotelLabel = Titanium.UI.createLabel
      borderWidth: 0
      text: deal.hotelName
      color: '#fff'
      left: 155
      font:
        fontSize: 14
        fontWeight: 'bold'
      height: 30
      width: 160
      top: 5
    @row.add(hotelLabel)

    priceLabel = Titanium.UI.createLabel
      text: deal.salePriceCents + "€"
      color: '#fff'
      left: 155
      borderWidth: 0
      font:
        fontSize: 28
        fontWeight: 'bold'
      height: 30
      width: 70
      top: 40
    @row.add(priceLabel)

    antesLabel = Titanium.UI.createLabel
      text: L('before')
      color: '#868d92'
      left: 230
      font:
        fontSize: 10
      height: 10
      width: 40
      top: 40
    @row.add(antesLabel)

    normalPriceLabel = Titanium.UI.createLabel
      text: deal.priceCents + "€"
      color: '#868d92'
      left: 230
      borderWidth: 0
      textAlign: 'left'
      font:
        fontSize: 14
        fontWeight: 'bold'
      height: 30
      width: 35
      top: 45
    @row.add(normalPriceLabel)

    sepVertView = Titanium.UI.createView
      backgroundColor: '#444547' 
      left: 225
      top: 42
      height: 25
      width: 1
    @row.add(sepVertView)

    roomTypeImage = Titanium.UI.createImageView 
      left: 155
      top: 80
      height: 34
      width: 88

    if deal.roomType is 'lujo'
      image = 'images/lujo.png'
      icon = '/images/yellow_arrow.png'
    if deal.roomType is 'elegante'
      icon = '/images/purple_arrow.png'
      image = 'images/elegante.png'
    if deal.roomType is 'confort'
      icon = '/images/blue_arrow.png'
      image = 'images/confort.png'
	
    roomTypeImage.image = image
    @row.add(roomTypeImage)
    @row.rightImage = icon
    
    soldOutView = Titanium.UI.createView
      opacity: 0.6
      backgroundColor: '#ffffff' 
      left: 0
      top: 0
      height: 120
      width: '120%'
    
    soldOutLabel = Titanium.UI.createLabel
      borderWidth: 0
      text: L('soldOut')
      color: '#ff0000'
      left: 18
      font:
        fontSize: 22
        fontWeight: 'bold'
      height: 30
      width: 160
      top: 45

    soldOutView.add(soldOutLabel)
    if deal.quantity is 0
      @row.add(soldOutView)

root.listDealsRow = ListDealsRow
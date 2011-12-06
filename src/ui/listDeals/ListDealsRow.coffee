class ListDealsRow
  constructor: (deal,n) ->
    imagex = {}
    textColor = "white"
    @row = Ti.UI.createTableViewRow
      hasChild: true
      #rightImage: '/images/blue_arrow.png'
      identionLevel: 200
      height: 120
      selectionStyle: 'none'
      backgroundGradient:
        type:'linear'
        colors:[{color:'#07151d',position:0.1},{color:'#0d1e28',position:1.0}]
      fontSize: 6
      deal: deal
      color: '#fff'

    image = Titanium.UI.createImageView 
      image: deal.mainImageBig
      borderRadius: 0
      left: 0
      width: 320
      height: 120
    @row.add(image)

    hotelBarLabel = Titanium.UI.createLabel
      borderWidth: 0
      #backgroundColor: '#0d1e28'
      backgroundColor: 'black'
      opacity: 0.7
      color: '#fff'
      left: 0
      height: 20
      width: 320
      top: 0
    @row.add(hotelBarLabel)

    hotelLabel = Titanium.UI.createLabel
      text: deal.hotelName
      color: '#fff'
      left: 5
      font:
        fontSize: 14
        fontWeight: 'bold'
      height: 20
      width: 250
      top: 0
    @row.add(hotelLabel)

    priceTag = Titanium.UI.createLabel
      opacity: 0.9
      backgroundImage: '/images/price_bas5.png'
      left: 245
      borderWidth: 0
      textAlign: 'center' 
      height: 100
      width: 71
      top: 0
    @row.add(priceTag)

    priceLabel = Titanium.UI.createLabel
      text: deal.salePriceCents + "€"
      color: textColor
      left: 241
      borderWidth: 0
      textAlign: 'center'
      font:
        fontSize: 22
        fontWeight: 'bold'  
      height: 35
      width: 80
      top: 15
    @row.add(priceLabel)

    antesLabel = Titanium.UI.createLabel
      text: L('before')
      color: '#eeeeee'
      textAlign: 'left'
      left: 256
      font:
        fontSize: 9
      height: 15
      width: 40
      top: 40
    @row.add(antesLabel)

    normalPriceLabel = Titanium.UI.createLabel
      text: deal.priceCents + "€"
      color: '#eeeeee'
      left: 256
      borderWidth: 0
      textAlign: 'left'
      font:
        fontSize: 12
        fontWeight: 'bold'
      height: 30
      width: 35
      top: 45
    @row.add(normalPriceLabel)
  
    extraNightsLabel = Titanium.UI.createLabel
      text: L('oneNight')
      textAlign: "center"
      color: textColor
      font:
        fontSize: 10
      height: 20
      left: 250
      width: 60
      top: 68

    if deal.priceDay2 > 0
      extraNightsLabel.text = L('stayTwoNights')
    if deal.priceDay3 > 0
      extraNightsLabel.text = L('stayThreeNights')
    if deal.priceDay4 > 0
      extraNightsLabel.text = L('stayFourNights')
    if deal.priceDay5 > 0
      extraNightsLabel.text = L('stayFiveNights')
 
    @row.add(extraNightsLabel)

    roomTypeLabel = Titanium.UI.createLabel
      width: 80
      height: 20
      color: textColor
      text: deal.roomTypeText
      textAlign: "center"
      font:
        fontSize: 10
        fontWeight: 'bold'
        fontFamily:'Helvetica Neue'
      top: 2
      left: 241

    if deal.roomType is 'lujo'
      if deal.roomTypeText is undefined or deal.roomTypeText is null or deal.roomTypeText.length < 2
        roomTypeLabel.text = 'LUXURY'
      else roomTypeLabel.text = deal.roomTypeText.toUpperCase()
      #roomTypeLabel.backgroundColor = "#e5e79d"
      #hotelLabel.backgroundColor = "#e5e79d"
      #roomTypeLabel.borderColor = "#e5e79d"
      priceTag.backgroundImage = "/images/price_luxury1.png"
      icon = '/images/yellow_arrow.png'
    if deal.roomType is 'elegante' 
      if deal.roomTypeText is undefined or deal.rootmTypeText is null or deal.roomTypeText.length < 2
        roomTypeLabel.text = 'ELEGANCE' 
      else roomTypeLabel.text = deal.roomTypeText.toUpperCase()     
      #roomTypeLabel.backgroundColor = "#c7bcd2"
      #hotelLabel.backgroundColor = "#c7bcd2"
      #roomTypeLabel.borderColor = "#c7bcd2"
      priceTag.backgroundImage = "/images/price_elegance1.png"
      icon = '/images/purple_arrow.png'
    if deal.roomType is 'confort' 
      if deal.roomTypeText is undefined or deal.roomTypeText is null or deal.roomTypeText.length < 2
        roomTypeLabel.text = 'BASIC'
      else roomTypeLabel.text = deal.roomTypeText.toUpperCase()
      #roomTypeLabel.backgroundColor = "#a3bfd4"
      #hotelLabel.backgroundColor = "#a3bfd4"
      #roomTypeLabel.borderColor = "#a3bfd4"
      priceTag.backgroundImage = "/images/price_basic1.png"
      icon = '/images/blue_arrow.png'
	
    @row.add(roomTypeLabel)
    #@row.rightImage = icon
    
    soldOutView = Titanium.UI.createView
      opacity: 0.6
      backgroundColor: '#ffffff' 
      left: 0
      top: 0
      height: 120
      width: '125%'
    
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
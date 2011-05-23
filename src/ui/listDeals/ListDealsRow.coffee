class ListDealsRow
  constructor: (deal) ->
    @row = Ti.UI.createTableViewRow
      hasChild: true
      identionLevel: 200
      height: 120
      backgroundGradient:
        type:'linear'
        #colors:[{color:'#494949',position:0.1},{color:'#3f3f3f',position:0.50},{color:'#2b2b2b',position:1.0}]
        colors:[{color:'#093344',position:0.1},{color:'#0b222e',position:0.50},{color:'#0c1b24',position:1.0}]
      fontSize: 6
      deal: deal
      color: '#fff'
    image = Titanium.UI.createImageView 
      image: deal.mainImageSmall
      borderRadius: 10
      borderColor: '#fff'
      borderWidth: 3
      left: 4
      width: 140
      height: 110
    @row.add(image)
    hotelLabel = Titanium.UI.createLabel
      text: deal.hotelName
      color: '#fff'
      left: 155
      font:
        fontSize: 14
      height: 70
      width: 135
      top: 0
    @row.add(hotelLabel)
    priceLabel = Titanium.UI.createLabel
      text: deal.salePriceCents + "€"
      color: '#fff'
      left: 155
      font:
        fontSize: 24
        fontWeight: 'bold'
      height: 70
      width: 135
      top: 25
    @row.add(priceLabel)

    normalPriceLabel = Titanium.UI.createLabel
      text: deal.priceCents + "€"
      color: '#333'
      left: 220
      font:
        fontSize: 14
      height: 70
      width: 135
      top: 25
    @row.add(normalPriceLabel)

    roomTypeLabel = Titanium.UI.createLabel
      text: deal.roomType
      color: '#fff'
      left: 155
      font:
        fontSize: 14
      height: 70
      width: 135
      top: 55
    @row.add(roomTypeLabel)

root.listDealsRow = ListDealsRow
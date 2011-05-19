class ListDealsRow
  constructor: (deal) ->
    @row = Ti.UI.createTableViewRow
      hasChild: true
      identionLevel: 200
      height: 120
      backgroundColor: '#fff'
      fontSize: 6
      deal: deal
      color: '#000'
    image = Titanium.UI.createImageView 
      image: deal.mainImageSmall
      left: 4
      width: 140
      height: 110
    @row.add(image)
    hotelLabel = Titanium.UI.createLabel
      text: deal.hotelName
      color: '#000'
      left: 155
      font:
        fontSize: 14
      height: 70
      width: 135
      top: 0
    @row.add(hotelLabel)
    priceLabel = Titanium.UI.createLabel
      text: deal.salePriceCents + "€"
      color: '#660000'
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
      color: '#003399'
      left: 155
      font:
        fontSize: 14
      height: 70
      width: 135
      top: 55
    @row.add(roomTypeLabel)

root.listDealsRow = ListDealsRow
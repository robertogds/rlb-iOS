(function() {
  var ListDealsRow;
  ListDealsRow = (function() {
    function ListDealsRow(deal) {
      var hotelLabel, image, normalPriceLabel, priceLabel, roomTypeLabel;
      this.row = Ti.UI.createTableViewRow({
        hasChild: true,
        identionLevel: 200,
        height: 120,
        backgroundGradient: {
          type: 'linear',
          colors: [
            {
              color: '#093344',
              position: 0.1
            }, {
              color: '#0b222e',
              position: 0.50
            }, {
              color: '#0c1b24',
              position: 1.0
            }
          ]
        },
        fontSize: 6,
        deal: deal,
        color: '#fff'
      });
      image = Titanium.UI.createImageView({
        image: deal.mainImageSmall,
        borderRadius: 10,
        borderColor: '#fff',
        borderWidth: 3,
        left: 4,
        width: 140,
        height: 110
      });
      this.row.add(image);
      hotelLabel = Titanium.UI.createLabel({
        text: deal.hotelName,
        color: '#fff',
        left: 155,
        font: {
          fontSize: 14
        },
        height: 70,
        width: 135,
        top: 0
      });
      this.row.add(hotelLabel);
      priceLabel = Titanium.UI.createLabel({
        text: deal.salePriceCents + "€",
        color: '#fff',
        left: 155,
        font: {
          fontSize: 24,
          fontWeight: 'bold'
        },
        height: 70,
        width: 135,
        top: 25
      });
      this.row.add(priceLabel);
      normalPriceLabel = Titanium.UI.createLabel({
        text: deal.priceCents + "€",
        color: '#333',
        left: 220,
        font: {
          fontSize: 14
        },
        height: 70,
        width: 135,
        top: 25
      });
      this.row.add(normalPriceLabel);
      roomTypeLabel = Titanium.UI.createLabel({
        text: deal.roomType,
        color: '#fff',
        left: 155,
        font: {
          fontSize: 14
        },
        height: 70,
        width: 135,
        top: 55
      });
      this.row.add(roomTypeLabel);
    }
    return ListDealsRow;
  })();
  root.listDealsRow = ListDealsRow;
}).call(this);

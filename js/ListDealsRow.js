(function() {
  var ListDealsRow;
  ListDealsRow = (function() {
    function ListDealsRow(deal) {
      var antesLabel, hotelLabel, image, normalPriceLabel, priceLabel, roomTypeImage, separator, tachaImage;
      this.row = Ti.UI.createTableViewRow({
        hasChild: true,
        rightImage: '/images/blue_arrow.png',
        identionLevel: 200,
        height: 120,
        backgroundGradient: {
          type: 'linear',
          colors: [
            {
              color: '#07151d',
              position: 0.1
            }, {
              color: '#0d1e28',
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
        borderWidth: 2,
        left: 4,
        width: 140,
        height: 110
      });
      this.row.add(image);
      hotelLabel = Titanium.UI.createLabel({
        borderWidth: 0,
        text: deal.hotelName,
        color: '#fff',
        left: 155,
        font: {
          fontSize: 14,
          fontWeight: 'bold'
        },
        height: 30,
        width: 160,
        top: 5
      });
      this.row.add(hotelLabel);
      priceLabel = Titanium.UI.createLabel({
        text: deal.salePriceCents + "€",
        color: '#fff',
        left: 155,
        borderWidth: 0,
        font: {
          fontSize: 28,
          fontWeight: 'bold'
        },
        height: 30,
        width: 70,
        top: 40
      });
      this.row.add(priceLabel);
      antesLabel = Titanium.UI.createLabel({
        text: 'antes',
        color: '#868d92',
        left: 227,
        font: {
          fontSize: 10
        },
        height: 10,
        width: 40,
        top: 40
      });
      this.row.add(antesLabel);
      normalPriceLabel = Titanium.UI.createLabel({
        text: deal.priceCents + "€",
        color: '#868d92',
        left: 227,
        borderWidth: 0,
        textAlign: 'center',
        font: {
          fontSize: 14,
          fontWeight: 'bold'
        },
        height: 30,
        width: 35,
        top: 45
      });
      this.row.add(normalPriceLabel);
      tachaImage = Titanium.UI.createImageView({
        left: 226,
        top: 55,
        height: 1,
        width: 35,
        image: 'images/tacha.png'
      });
      roomTypeImage = Titanium.UI.createImageView({
        left: 155,
        top: 80,
        height: 34,
        width: 88
      });
      if (deal.roomType === 'lujo') {
        roomTypeImage.image = 'images/lujo.png';
      } else if (deal.roomType === 'elegante') {
        roomTypeImage.image = 'images/elegante.png';
      } else if (deal.roomType === 'confort') {
        roomTypeImage.image = 'images/confort.png';
      }
      this.row.add(roomTypeImage);
      separator = Titanium.UI.createImageView({
        image: 'images/separator.png',
        top: 114
      });
    }
    return ListDealsRow;
  })();
  root.listDealsRow = ListDealsRow;
}).call(this);

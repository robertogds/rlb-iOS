(function() {
  var ListDealsRow;
  ListDealsRow = (function() {
    function ListDealsRow(deal) {
      var hotelLabel, image, normalPriceLabel, priceLabel, roomTypeImage, separator, tachaImage;
      this.row = Ti.UI.createTableViewRow({
        hasChild: false,
        identionLevel: 200,
        height: 120,
        backgroundGradient: {
          type: 'linear',
          colors: [
            {
              color: '#1b3c50',
              position: 0.1
            }, {
              color: '#0c1c25',
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
      normalPriceLabel = Titanium.UI.createLabel({
        text: deal.priceCents + "€",
        color: '#bfbfbf',
        left: 227,
        borderWidth: 0,
        textAlign: 'center',
        font: {
          fontSize: 14
        },
        height: 30,
        width: 35,
        top: 40
      });
      this.row.add(normalPriceLabel);
      tachaImage = Titanium.UI.createImageView({
        left: 226,
        top: 55,
        height: 1,
        width: 35,
        image: 'images/tacha.png'
      });
      this.row.add(tachaImage);
      roomTypeImage = Titanium.UI.createImageView({
        left: 155,
        top: 80,
        height: 30,
        width: 60
      });
      if (deal.roomType === 'lujo') {
        roomTypeImage.image = 'images/icon_lujo.png';
      } else if (deal.roomType === 'elegante') {
        roomTypeImage.image = 'images/icon_elegante.png';
      } else if (deal.roomType === 'confort') {
        roomTypeImage.image = 'images/icon_confort.png';
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

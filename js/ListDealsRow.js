(function() {
  var ListDealsRow;
  ListDealsRow = (function() {
    function ListDealsRow(deal) {
      var antesLabel, extraNightsLabel, hotelLabel, icon, image, normalPriceLabel, priceLabel, roomTypeLabel, sepVertView, soldOutLabel, soldOutView, tonightLabel;
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
        borderRadius: 0,
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
        top: 35
      });
      this.row.add(priceLabel);
      antesLabel = Titanium.UI.createLabel({
        text: L('before'),
        color: '#868d92',
        left: 230,
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
        left: 230,
        borderWidth: 0,
        textAlign: 'left',
        font: {
          fontSize: 14,
          fontWeight: 'bold'
        },
        height: 30,
        width: 35,
        top: 45
      });
      this.row.add(normalPriceLabel);
      sepVertView = Titanium.UI.createView({
        backgroundColor: '#444547',
        left: 225,
        top: 42,
        height: 25,
        width: 1
      });
      this.row.add(sepVertView);
      tonightLabel = Titanium.UI.createLabel({
        text: "Tonight",
        color: '#fff',
        left: 155,
        borderWidth: 0,
        font: {
          fontSize: 12,
          fontWeight: 'bold'
        },
        height: 20,
        width: 70,
        top: 60
      });
      this.row.add(tonightLabel);
      extraNightsLabel = Titanium.UI.createLabel({
        text: L('oneNight'),
        textAlign: "right",
        color: '#868d92',
        font: {
          fontSize: 12
        },
        height: 30,
        left: 230,
        width: 80,
        top: 85
      });
      if (deal.priceDay2 > 0) {
        extraNightsLabel.text = L('1-2Nights');
      }
      if (deal.priceDay3 > 0) {
        extraNightsLabel.text = L('1-3Nights');
      }
      if (deal.priceDay4 > 0) {
        extraNightsLabel.text = L('1-4Nights');
      }
      if (deal.priceDay5 > 0) {
        extraNightsLabel.text = L('1-5Nights');
      }
      this.row.add(extraNightsLabel);
      roomTypeLabel = Titanium.UI.createLabel({
        borderWidth: 1,
        borderColor: '#0098cb',
        width: 70,
        height: 25,
        borderRadius: 5,
        backgroundColor: '#0098cb',
        text: deal.roomTypeText,
        textAlign: "center",
        font: {
          fontSize: 14,
          fontWeight: 'bold',
          fontFamily: 'Helvetica Neue'
        },
        top: 87,
        left: 155
      });
      if (deal.roomType === 'lujo') {
        if (deal.roomTypeText === void 0 || deal.roomTypeText === '') {
          roomTypeLabel.text = 'luxury';
        }
        roomTypeLabel.backgroundColor = "#e5e79d";
        roomTypeLabel.borderColor = "#e5e79d";
        icon = '/images/yellow_arrow.png';
      }
      if (deal.roomType === 'elegante') {
        if (deal.roomTypeText === void 0 || deal.roomTypeText === '') {
          roomTypeLabel.text = 'elegance';
        }
        roomTypeLabel.backgroundColor = "#c7bcd2";
        roomTypeLabel.borderColor = "#c7bcd2";
        icon = '/images/purple_arrow.png';
      }
      if (deal.roomType === 'confort') {
        if (deal.roomTypeText === void 0 || deal.roomTypeText === '') {
          roomTypeLabel.text = 'basic';
        }
        roomTypeLabel.backgroundColor = "#a3bfd4";
        roomTypeLabel.borderColor = "#a3bfd4";
        icon = '/images/blue_arrow.png';
      }
      this.row.add(roomTypeLabel);
      this.row.rightImage = icon;
      soldOutView = Titanium.UI.createView({
        opacity: 0.6,
        backgroundColor: '#ffffff',
        left: 0,
        top: 0,
        height: 120,
        width: '125%'
      });
      soldOutLabel = Titanium.UI.createLabel({
        borderWidth: 0,
        text: L('soldOut'),
        color: '#ff0000',
        left: 18,
        font: {
          fontSize: 22,
          fontWeight: 'bold'
        },
        height: 30,
        width: 160,
        top: 45
      });
      soldOutView.add(soldOutLabel);
      if (deal.quantity === 0) {
        this.row.add(soldOutView);
      }
    }
    return ListDealsRow;
  })();
  root.listDealsRow = ListDealsRow;
}).call(this);

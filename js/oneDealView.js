(function() {
  var mapview, mountainView, separator;
  Ti.include('js/buyButton.js');
  root.oneDealScrollView = Titanium.UI.createScrollView({
    contentWidth: 'auto',
    contentHeight: 'auto',
    top: 0,
    showVerticalScrollIndicator: true
  });
  root.oneDealView = Titanium.UI.createView({
    background: 'transparent',
    borderWidth: 0,
    width: 320,
    top: 0
  });
  root.oneDealButtonBar = Titanium.UI.createButtonBar({
    labels: ['Reservar', 'Info', 'Mapa', 'Fotos'],
    backgroundColor: '#000',
    top: 0,
    style: Titanium.UI.iPhone.SystemButtonStyle.BAR,
    height: 25,
    width: 320
  });
  root.oneDealView.add(root.oneDealButtonBar);
  root.oneDealImage = Titanium.UI.createImageView({
    top: 25,
    width: 320,
    height: 120
  });
  separator = Titanium.UI.createImageView({
    top: 170,
    image: 'images/separator.png',
    width: 300
  });
  root.oneDealView.add(separator);
  root.oneDealPriceLabel = Titanium.UI.createLabel({
    width: 320,
    height: 70,
    textAlign: 'center',
    color: '#fff',
    font: {
      fontSize: 28,
      fontWeight: 'normal',
      fontFamily: 'Helvetica Neue'
    },
    top: 260
  });
  root.oneDealAddressLabel = Titanium.UI.createLabel({
    width: 320,
    height: 80,
    textAlign: 'center',
    color: '#fff',
    font: {
      fontSize: 20,
      fontWeight: 'normal',
      fontFamily: 'Helvetica Neue'
    },
    top: 140
  });
  root.oneDealView.add(root.oneDealAddressLabel);
  root.descriptionLabel = Titanium.UI.createLabel({
    width: 300,
    height: 20,
    textAlign: 'left',
    color: '#fff',
    font: {
      fontSize: 15,
      fontWeight: 'normal',
      fontFamily: 'Helvetica Neue'
    },
    top: 220
  });
  mountainView = Titanium.Map.createAnnotation({
    latitude: 37.390749,
    longitude: -122.081651,
    title: "Appcelerator Headquarters",
    subtitle: 'Mountain View, CA',
    pincolor: Titanium.Map.ANNOTATION_RED,
    animate: true,
    leftButton: '../images/appcelerator_small.png',
    myid: 1
  });
  mapview = Titanium.Map.createView({
    mapType: Titanium.Map.STANDARD_TYPE,
    top: 400,
    width: 280,
    height: 180,
    region: {
      latitude: 37.390749,
      longitude: -122.081651,
      latitudeDelta: 0.01,
      longitudeDelta: 0.01
    },
    animate: true,
    regionFit: true,
    userLocation: true,
    annotations: [mountainView]
  });
  root.oneDealView.add(root.oneDealImage);
  root.oneDealView.add(root.buyButton);
  root.oneDealView.add(root.oneDealPriceLabel);
  root.oneDealView.add(root.descriptionLabel);
  root.oneDealView.add(mapview);
  root.oneDealWindow.add(root.oneDealView);
  root.showDealView = function(deal) {
    root.deal = deal;
    root.oneDealWindow.title = deal.hotelName;
    root.oneDealImage.image = deal.mainImageBig;
    root.oneDealPriceLabel.text = deal.salePriceCents + "€" + '  Sólo Esta Noche';
    root.oneDealAddressLabel.text = deal.hotelName + '\n' + deal.address;
    root.descriptionLabel.text = deal.description;
    return root.oneDealWindow;
  };
}).call(this);

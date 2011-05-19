(function() {
  var mapview, mountainView;
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
    height: 650,
    top: 0
  });
  root.oneDealImage = Titanium.UI.createImageView({
    top: 0,
    width: 320,
    height: 120
  });
  root.oneDealPriceLabel = Titanium.UI.createLabel({
    width: 320,
    height: 70,
    textAlign: 'center',
    color: '#000',
    font: {
      fontSize: 28,
      fontWeight: 'normal',
      fontFamily: 'Helvetica Neue'
    },
    top: 120
  }, root.descriptionLabel = Titanium.UI.createLabel({
    width: 300,
    height: 40,
    textAlign: 'left',
    color: '#000',
    font: {
      fontSize: 10,
      fontWeight: 'normal'
    },
    top: 280
  }), root.descButton = Titanium.UI.createButton({
    title: 'Descripción    >',
    width: 300,
    height: 40,
    font: {
      fontSize: 18,
      fontWeight: 'bold',
      fontFamily: 'Helvetica Neue'
    },
    top: 240
  }), root.mapButton = Titanium.UI.createButton({
    title: 'Mapa    >',
    width: 300,
    height: 40,
    font: {
      fontSize: 18,
      fontWeight: 'bold',
      fontFamily: 'Helvetica Neue'
    },
    top: 340
  }));
  root.imagesButton = Titanium.UI.createButton({
    title: 'Fotos    >',
    width: 300,
    height: 40,
    font: {
      fontSize: 18,
      fontWeight: 'bold',
      fontFamily: 'Helvetica Neue'
    },
    top: 590
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
  root.oneDealView.add(mapview);
  root.showDealView = function(deal) {
    root.deal = deal;
    root.oneDealWindow.title = deal.hotelName;
    root.oneDealImage.image = deal.mainImageBig;
    root.oneDealPriceLabel.text = deal.salePriceCents + "€" + '  Sólo Esta Noche';
    root.descriptionLabel.text = deal.description;
    root.oneDealView.add(root.oneDealImage);
    root.oneDealView.add(root.oneDealPriceLabel);
    root.oneDealView.add(root.buyButton);
    root.oneDealView.add(root.descriptionLabel);
    root.oneDealView.add(root.descButton);
    root.oneDealView.add(root.mapButton);
    root.oneDealView.add(root.imagesButton);
    root.oneDealScrollView.add(root.oneDealView);
    root.oneDealWindow.add(root.oneDealScrollView);
    return root.oneDealWindow;
  };
}).call(this);

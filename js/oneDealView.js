(function() {
  var separator1, separator2;
  Ti.include('js/buyButton.js', 'js/infoView.js', 'js/oneDealButtonBar.js', 'js/oneDealMapView.js', 'js/imagesScrollView.js');
  root.oneDealView = Titanium.UI.createView({
    background: 'transparent',
    borderWidth: 0,
    width: 320,
    top: 25
  });
  root.oneDealImage = Titanium.UI.createImageView({
    top: 0,
    width: 320,
    height: 120
  });
  separator1 = Titanium.UI.createImageView({
    top: 145,
    image: 'images/separator.png',
    width: 300
  });
  root.oneDealView.add(separator1);
  separator2 = Titanium.UI.createImageView({
    top: 60,
    image: 'images/separator.png',
    width: 300
  });
  root.oneDealView.add(separator2);
  root.oneDealPriceLabel = Titanium.UI.createLabel({
    width: 320,
    height: 60,
    textAlign: 'center',
    color: '#fff',
    font: {
      fontSize: 28,
      fontWeight: 'normal',
      fontFamily: 'Helvetica Neue'
    },
    top: 235
  });
  root.oneDealAddressLabel = Titanium.UI.createLabel({
    width: 320,
    height: 80,
    textAlign: 'center',
    color: '#fff',
    font: {
      fontSize: 18,
      fontWeight: 'normal',
      fontFamily: 'Helvetica Neue'
    },
    top: 115
  });
  root.descriptionLabel = Titanium.UI.createLabel({
    width: 300,
    height: 20,
    textAlign: 'left',
    color: '#fff',
    font: {
      fontSize: 18,
      fontWeight: 'normal',
      fontFamily: 'Helvetica Neue'
    },
    top: 210
  });
  root.oneDealView.add(root.oneDealImage);
  root.oneDealView.add(root.oneDealAddressLabel);
  root.oneDealView.add(root.buyButton);
  root.oneDealView.add(root.oneDealPriceLabel);
  root.oneDealView.add(root.descriptionLabel);
  root.oneDealWindow.add(root.oneDealView);
  root.oneDealWindow.add(root.oneDealButtonBarView);
  root.showDealView = function(deal) {
    var region;
    root.deal = deal;
    root.imagesRemove();
    root.mapView.removeAllAnnotations();
    root.hotelAnnotation.latitude = deal.latitude;
    root.hotelAnnotation.longitude = deal.longitude;
    root.hotelAnnotation.title = deal.hotelName;
    root.hotelAnnotation.subtitle = deal.address;
    region = {
      latitude: deal.latitude,
      longitude: deal.longitude,
      latitudeDelta: 0.01,
      longitudeDelta: 0.01
    };
    root.mapView.region = region;
    root.mapView.setLocation(region);
    root.mapView.addAnnotation(root.hotelAnnotation);
    root.oneDealWindow.title = deal.hotelName;
    root.oneDealImage.image = deal.mainImageBig;
    root.oneDealPriceLabel.text = deal.salePriceCents + "€" + '  Sólo Esta Noche';
    root.oneDealAddressLabel.text = deal.hotelName + '\n' + deal.address;
    root.descriptionLabel.text = deal.description;
    root.whyLabel.text = deal.description;
    root.image1.image = deal.image1;
    root.image2.image = deal.image2;
    root.image3.image = deal.image3;
    root.image4.image = deal.image4;
    root.image5.image = deal.image5;
    return 1;
  };
}).call(this);
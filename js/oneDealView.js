(function() {
  var addressView, antesLabel, bookingLabel, priceView, sepVertView, separator1, separator2, separator3;
  Ti.include('/js/oneDealButtonBar.js', '/js/oneDealMapView.js', '/js/imagesScrollView.js', '/js/infoDealTable.js');
  root.oneDealView = Titanium.UI.createView({
    background: 'transparent',
    borderWidth: 0,
    width: 320,
    top: 40
  });
  root.oneDealImage = Titanium.UI.createImageView({
    top: 0,
    width: 320,
    height: 120
  });
  root.oneDealImage.addEventListener('click', function(e) {
    root.imagesWindow.add(root.imagesScrollView);
    return root.tabGroup.activeTab.open(root.imagesWindow, {
      animated: true
    });
  });
  separator1 = new root.GenericSeparatorView(120).view;
  root.oneDealView.add(separator1);
  separator2 = new root.GenericSeparatorView(200).view;
  root.oneDealView.add(separator2);
  priceView = Titanium.UI.createView({
    backgroundColor: 'black',
    borderWidth: 0,
    width: 320,
    top: 122,
    height: 77
  });
  root.oneDealPriceLabel = Titanium.UI.createLabel({
    width: 85,
    textAlign: 'left',
    color: '#fff',
    font: {
      fontSize: 36,
      fontWeight: 'bold',
      fontFamily: 'Helvetica Neue'
    },
    top: 0,
    left: 15
  });
  priceView.add(root.oneDealPriceLabel);
  sepVertView = Titanium.UI.createView({
    backgroundColor: '#444547',
    left: 105,
    top: 26,
    height: 28,
    width: 1
  });
  priceView.add(sepVertView);
  antesLabel = Titanium.UI.createLabel({
    text: L('before'),
    color: '#868d92',
    left: 110,
    font: {
      fontSize: 16
    },
    width: 40,
    height: 20,
    top: 18
  });
  priceView.add(antesLabel);
  root.oneDealNormalPriceLabel = Titanium.UI.createLabel({
    width: 77,
    height: 30,
    textAlign: 'left',
    color: '#868d92',
    font: {
      fontSize: 20,
      fontWeight: 'bold',
      fontFamily: 'Helvetica Neue'
    },
    top: 33,
    left: 110
  });
  priceView.add(root.oneDealNormalPriceLabel);
  bookingLabel = Titanium.UI.createLabel({
    backgroundImage: '/images/booking_background.png',
    width: 108,
    height: 33,
    borderRadius: 5,
    backgroundColor: '#0098cb',
    text: ' ' + L('bookingBlueButtonText'),
    font: {
      fontSize: 18,
      fontWeight: 'bold',
      fontFamily: 'Helvetica Neue'
    },
    top: 24,
    left: 200
  });
  bookingLabel.addEventListener('click', function(e) {
    return root.showBookingView();
  });
  priceView.add(bookingLabel);
  addressView = Titanium.UI.createView({
    backgroundColor: 'transparent',
    borderWidth: 0,
    borderColor: 'red',
    width: 320,
    top: 200,
    height: 50
  });
  root.oneDealAddressLabel = Titanium.UI.createLabel({
    width: 280,
    height: 40,
    textAlign: 'left',
    color: '#fff',
    font: {
      fontSize: 14,
      fontWeight: 'normal',
      fontFamily: 'Helvetica Neue',
      fontWeight: 'bold'
    },
    left: 25
  });
  addressView.add(root.oneDealAddressLabel);
  separator3 = new root.GenericSeparatorView(250).view;
  root.oneDealView.add(separator3);
  root.descriptionLabel = Titanium.UI.createLabel({
    width: 280,
    height: 60,
    textAlign: 'left',
    color: '#fff',
    font: {
      fontSize: 14,
      fontWeight: 'normal',
      fontFamily: 'Helvetica Neue'
    },
    top: 260,
    left: 25
  });
  root.oneDealView.add(root.oneDealImage);
  root.oneDealView.add(priceView);
  root.oneDealView.add(addressView);
  root.oneDealView.add(root.descriptionLabel);
  root.oneDealWindow.add(root.oneDealButtonBarView);
  root.oneDealWindow.add(root.oneDealView);
  root.showDealView = function(deal) {
    var aroundRow, aroundTitle, aroundView, data, detailRow, detailTitle, detailView, foodDrinkRow, foodDrinkTitle, foodDrinkView, hotelRow, hotelTitle, hotelView, region, roomRow, roomTitle, roomView;
    root.deal = deal;
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
    root.oneDealPriceLabel.text = deal.salePriceCents + "€";
    root.oneDealNormalPriceLabel.text = deal.priceCents + "€";
    root.oneDealAddressLabel.text = deal.address + '\n' + deal.city.name;
    root.descriptionLabel.text = deal.hotelText;
    root.image1.image = deal.image1;
    root.image2.image = deal.image2;
    root.image3.image = deal.image3;
    root.image4.image = deal.image4;
    root.image5.image = deal.image5;
    Ti.API.info(deal.image1);
    Ti.API.info(deal.image2);
    Ti.API.info(deal.image3);
    Ti.API.info(deal.image4);
    Ti.API.info(deal.image5);
    detailTitle = L('detailTitle');
    hotelTitle = L('hotelTitle');
    roomTitle = L('roomTitle');
    foodDrinkTitle = L('foodDrinkTitle');
    aroundTitle = L('around');
    detailRow = new root.GenericTextRow().row;
    hotelRow = new root.GenericTextRow().row;
    roomRow = new root.GenericTextRow().row;
    foodDrinkRow = new root.GenericTextRow().row;
    aroundRow = new root.GenericTextRow().row;
    detailView = new root.GenericTextView(0, detailTitle, deal.detailText).view;
    hotelView = new root.GenericTextView(0, hotelTitle, deal.hotelText).view;
    roomView = new root.GenericTextView(0, roomTitle, deal.roomText).view;
    foodDrinkView = new root.GenericTextView(0, foodDrinkTitle, deal.foodDrinkText).view;
    aroundView = new root.GenericTextView(0, aroundTitle, deal.aroundText).view;
    detailRow.add(detailView);
    hotelRow.add(hotelView);
    roomRow.add(roomView);
    foodDrinkRow.add(foodDrinkView);
    aroundRow.add(aroundView);
    data = [];
    data.push(detailRow);
    data.push(hotelRow);
    data.push(roomRow);
    data.push(foodDrinkRow);
    data.push(aroundRow);
    root.infoDealTable.setData(data);
    root.oneDealWindow.remove(root.infoDealTable);
    root.oneDealWindow.remove(root.mapView);
    return root.oneDealWindow.add(root.oneDealView);
  };
}).call(this);

(function() {
  var addressView, descriptionView, separator1, separator2;
  Ti.include('/js/oneDealMapView.js', '/js/imagesScrollView.js', '/js/infoDealTable.js', '/js/priceView.js');
  if (Titanium.Platform.name === 'android') {
    Ti.include('/js/androidOneDealButtonBar.js');
  } else {
    Ti.include('/js/oneDealButtonBar.js');
  }
  root.oneDealView = Titanium.UI.createView({
    backgroundColor: '#0d1e28',
    width: Ti.Platform.displayCaps.platformWidth,
    top: 40
  });
  root.listImageView = Titanium.UI.createView({
    top: 0,
    height: '37%',
    width: Ti.Platform.displayCaps.platformWidth
  });
  root.oneDealImage = Titanium.UI.createImageView({
    top: 0,
    width: Ti.Platform.displayCaps.platformWidth,
    height: 'auto'
  });
  root.listImageView.add(root.oneDealImage);
  root.oneDealView.add(root.listImageView);
  root.oneDealImage.addEventListener('click', function(e) {
    root.imagesWindow.add(root.imagesScrollView);
    return root.tabGroup.activeTab.open(root.imagesWindow, {
      animated: true
    });
  });
  addressView = Titanium.UI.createView({
    backgroundColor: '#0d1e28',
    top: '61%',
    height: '17%'
  });
  descriptionView = Titanium.UI.createView({
    width: '100%',
    backgroundColor: '#0d1e28',
    top: '77%',
    height: 65
  });
  root.oneDealAddressLabel = Titanium.UI.createLabel({
    top: 0,
    height: '100%',
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
  root.descriptionLabel = Titanium.UI.createLabel({
    height: '100%',
    textAlign: 'left',
    color: '#fff',
    font: {
      fontSize: 14,
      fontWeight: 'normal',
      fontFamily: 'Helvetica Neue'
    },
    top: 0,
    left: 25
  });
  root.oneDealView.add(root.priceView);
  root.oneDealView.add(addressView);
  descriptionView.add(root.descriptionLabel);
  root.oneDealView.add(descriptionView);
  root.oneDealWindow.add(root.oneDealButtonBarView);
  root.oneDealWindow.add(root.oneDealView);
  separator1 = new root.GenericSeparatorView('61%').view;
  root.oneDealView.add(separator1);
  separator2 = new root.GenericSeparatorView('77%').view;
  root.oneDealView.add(separator2);
  root.showDealView = function(deal) {
    var aroundRow, aroundTitle, aroundView, data, detailRow, detailTitle, detailView, foodDrinkRow, foodDrinkTitle, foodDrinkView, hotelRow, hotelTitle, hotelView, region, roomRow, roomTitle, roomView;
    Ti.API.error("Empieza");
    root.deal = deal;
    if (deal.quantity === 0) {
      root.soldOutLabel.show();
      root.bookingLabel.hide();
    } else {
      root.soldOutLabel.hide();
      root.bookingLabel.show();
    }
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
    Ti.API.error("paso2");
    detailRow.add(detailView);
    hotelRow.add(hotelView);
    roomRow.add(roomView);
    foodDrinkRow.add(foodDrinkView);
    aroundRow.add(aroundView);
    root.infoHotelIpadLabel.text = deal.detailText;
    Ti.API.error("Paso3");
    data = [];
    data.push(detailRow);
    data.push(hotelRow);
    data.push(roomRow);
    data.push(foodDrinkRow);
    data.push(aroundRow);
    root.infoDealTable.setData(data);
    root.oneDealWindow.remove(root.infoDealTable);
    root.oneDealWindow.remove(root.mapView);
    root.oneDealWindow.add(root.oneDealView);
    return Ti.API.error("PasoFINAL");
  };
}).call(this);

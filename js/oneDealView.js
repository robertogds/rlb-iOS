(function() {
  var separator1, separator2;
  Ti.include('/js/oneDealButtonBar.js', '/js/oneDealMapView.js', '/js/imagesScrollView.js', '/js/infoDealTable.js', '/js/buyButton.js');
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
    top: 205
  });
  root.oneDealView.add(root.oneDealImage);
  root.oneDealView.add(root.oneDealAddressLabel);
  root.oneDealView.add(root.oneDealPriceLabel);
  root.oneDealView.add(root.descriptionLabel);
  root.oneDealView.add(root.buyButton);
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
    root.oneDealPriceLabel.text = deal.salePriceCents + "€" + '  Sólo Esta Noche';
    root.oneDealAddressLabel.text = deal.hotelName + '\n' + deal.address;
    root.descriptionLabel.text = deal.description;
    root.image1.image = deal.image1;
    root.image2.image = deal.image2;
    root.image3.image = deal.image3;
    root.image4.image = deal.image4;
    root.image5.image = deal.image5;
    detailTitle = "Los Detalles";
    hotelTitle = 'El Hotel';
    roomTitle = 'La Habitación';
    foodDrinkTitle = 'Comer y Beber';
    aroundTitle = 'Alrededores';
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

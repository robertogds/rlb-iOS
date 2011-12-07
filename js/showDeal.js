(function() {
  Ti.include('/js/oneDealMapView.js', '/js/imagesScrollView.js', '/js/infoDealTable.js', '/js/priceView.js', '/js/oneDealView.js');
  root.showDealView = function(deal) {
    var aroundRow, aroundTitle, aroundView, detailRow, detailTitle, detailView, foodDrinkRow, foodDrinkTitle, foodDrinkView, hotelRow, hotelTitle, hotelView, infoData, region, roomRow, roomTitle, roomView;
    Ti.API.info(deal);
    root.deal = deal;
    if (deal.quantity === 0) {
      root.bookingButtonView.remove(root.bookingButtonLabel);
      root.bookingButtonView.add(root.soldOutLabel);
      root.soldOutLabel.show();
      root.bookingButtonLabel.hide();
    } else {
      root.bookingButtonView.add(root.bookingButtonLabel);
      root.bookingButtonView.remove(root.soldOutLabel);
      root.soldOutLabel.hide();
      root.bookingButtonLabel.show();
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
    root.oneDealImage.image = deal.image10;
    root.oneDealPriceLabel.text = deal.salePriceCents + "€";
    root.oneDealNormalPriceLabel.text = deal.priceCents + "€";
    root.titleLabel.text = deal.hotelName + '\n' + deal.address;
    root.oneDealAddressLabel.text = deal.address;
    root.hotelAddressLabel.text = deal.address;
    root.hotelNameLabel.text = deal.hotelName;
    root.oneDealWindow.setTitleControl(root.titleView);
    root.shareTwitterImage.addEventListener('click', function(e) {
      return root.sharekit.share({
        title: 'ReallyLateBooking',
        text: String.format(L('shareTwitter'), deal.hotelName, deal.city.name),
        sharer: 'Twitter'
      });
    });
    root.shareFacebookImage.addEventListener('click', function(e) {
      return root.sharekit.share({
        title: 'ReallyLateBooking',
        text: String.format(L('shareFacebook'), deal.hotelName, deal.city.name),
        sharer: 'Facebook'
      });
    });
    root.shareEmailImage.addEventListener('click', function(e) {
      var emailDialog;
      emailDialog = Titanium.UI.createEmailDialog();
      emailDialog.subject = L('shareEmailSubject');
      emailDialog.messageBody = String.format(L('shareEmail'), deal.hotelName, deal.city.name);
      return emailDialog.open();
    });
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
    infoData = [];
    infoData.push(detailRow);
    infoData.push(hotelRow);
    infoData.push(roomRow);
    infoData.push(foodDrinkRow);
    infoData.push(aroundRow);
    root.infoDealTable.setData(infoData);
    root.oneDealWindow.remove(root.infoDealTable);
    root.oneDealWindow.remove(root.mapView);
    root.oneDealWindow.add(root.oneDealView);
    if (Titanium.App.Properties.hasProperty("user") || Titanium.Facebook.loggedIn) {
      root.bookingForEmail = root.user.email;
      root.bookingForFirstName = root.user.firstName;
      root.bookingForLastName = root.user.lastName;
    }
    if (root.deal.priceDay2 > 0) {
      return root.nightsRow.rightImage = '/images/blue_arrow.png';
    } else {
      return root.nightsRow.rightImage = '';
    }
  };
}).call(this);

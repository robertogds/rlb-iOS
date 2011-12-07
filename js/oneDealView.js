(function() {
  var barBookingButtonView, separator1, separator2;
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
  root.oneDealImage = Titanium.UI.createImageView({
    top: 0,
    width: 320,
    height: 330
  });
  root.oneDealView.add(root.oneDealImage);
  if (Titanium.Platform.name !== 'android') {
    root.oneDealImage.addEventListener('click', function(e) {
      root.imagesWindow.add(root.imagesScrollView);
      return root.tabGroup.activeTab.open(root.imagesWindow, {
        animated: true
      });
    });
  }
  root.bookingButtonView = Titanium.UI.createView({
    backgroundColor: 'transparent',
    top: 280,
    height: 47
  });
  barBookingButtonView = Titanium.UI.createView({
    backgroundColor: 'black',
    opacity: '0.7',
    top: 0,
    height: 50
  });
  root.bookingButtonView.add(barBookingButtonView);
  root.bookingButtonLabel = Titanium.UI.createLabel({
    backgroundImage: '/images/booking_background.png',
    borderWidth: 1,
    borderColor: '#0098cb',
    color: '#000',
    width: 260,
    height: 33,
    borderRadius: 5,
    backgroundColor: '#0098cb',
    text: L('bookingBlueButtonText') + '     ',
    textAlign: 'center',
    font: {
      fontSize: 18,
      fontWeight: 'bold',
      fontFamily: 'Helvetica Neue'
    }
  });
  root.bookingButtonLabel.addEventListener('click', function(e) {
    return root.showBookingView();
  });
  root.soldOutLabel = Titanium.UI.createLabel({
    width: 280,
    height: 33,
    borderRadius: 5,
    backgroundColor: '#000000',
    text: L('soldOut'),
    color: '#ff0000',
    font: {
      fontSize: 18,
      fontWeight: 'bold',
      fontFamily: 'Helvetica Neue'
    },
    left: '60%'
  });
  root.bookingButtonView.add(root.bookingButtonLabel);
  root.bookingButtonView.add(root.soldOutLabel);
  root.soldOutLabel.hide();
  root.oneDealAddressLabel = Titanium.UI.createLabel({
    top: 0,
    height: '100%',
    textAlign: 'left',
    color: '#fff',
    font: {
      fontSize: 12,
      fontFamily: 'Helvetica Neue',
      fontWeight: 'bold'
    },
    left: 20
  });
  root.titleView = Titanium.UI.createView({
    width: '100%',
    backgroundColor: 'transparent',
    top: 0,
    height: 50
  });
  root.hotelNameLabel = Titanium.UI.createLabel({
    top: 4,
    textAlign: 'center',
    color: 'white',
    text: 'Hotel',
    font: {
      fontWeight: 'normal',
      fontFamily: 'Helvetica Neue',
      fontWeight: 'bold',
      fontSize: 18
    },
    height: 20
  });
  root.hotelAddressLabel = Titanium.UI.createLabel({
    top: 24,
    textAlign: 'center',
    color: '#868d92',
    text: '',
    font: {
      fontSize: 14
    },
    fontWeight: 'normal',
    fontFamily: 'Helvetica Neue',
    fontWeight: 'bold',
    height: 20
  });
  root.titleLabel = Titanium.UI.createLabel({
    top: 0,
    height: '100%',
    textAlign: 'left',
    color: '#fff',
    textAlign: 'center',
    font: {
      fontSize: 12,
      fontWeight: 'normal',
      fontFamily: 'Helvetica Neue',
      fontWeight: 'bold'
    },
    left: 0
  });
  root.titleView.add(root.hotelNameLabel);
  root.titleView.add(root.hotelAddressLabel);
  root.oneDealView.add(root.priceView);
  root.oneDealView.add(root.bookingButtonView);
  root.oneDealWindow.add(root.oneDealButtonBarView);
  root.oneDealWindow.add(root.oneDealView);
  separator1 = new root.GenericSeparatorView(230).view;
  root.oneDealView.add(separator1);
  separator2 = new root.GenericSeparatorView(280).view;
  root.oneDealView.add(separator2);
}).call(this);

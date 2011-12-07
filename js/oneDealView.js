(function() {
  var separator1, separator2;
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
  root.shareFacebookImage = Titanium.UI.createImageView({
    top: 0,
    width: 40,
    height: 37,
    left: 170,
    image: '/images/share_facebook2.png'
  });
  root.shareTwitterImage = Titanium.UI.createImageView({
    top: 0,
    width: 40,
    height: 37,
    left: 220,
    image: '/images/share_twitter2.png'
  });
  root.shareEmailImage = Titanium.UI.createImageView({
    top: 0,
    width: 40,
    height: 37,
    left: 270,
    image: '/images/share_mail.png'
  });
  root.oneDealView.add(root.oneDealImage);
  root.oneDealView.add(root.shareFacebookImage);
  root.oneDealView.add(root.shareTwitterImage);
  root.oneDealView.add(root.shareEmailImage);
  if (Titanium.Platform.name !== 'android') {
    root.oneDealImage.addEventListener('click', function(e) {
      root.imagesWindow.add(root.imagesScrollView);
      return root.tabGroup.activeTab.open(root.imagesWindow, {
        animated: true
      });
    });
  }
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
    top: 8,
    textAlign: 'center',
    color: 'white',
    text: 'Hotel',
    font: {
      fontWeight: 'normal',
      fontFamily: 'Helvetica Neue',
      fontWeight: 'bold',
      fontSize: 20
    },
    height: 20
  });
  root.hotelAddressLabel = Titanium.UI.createLabel({
    top: 26,
    textAlign: 'center',
    color: '#868d92',
    text: '',
    font: {
      fontSize: 12
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
  root.oneDealWindow.add(root.oneDealButtonBarView);
  root.oneDealWindow.add(root.oneDealView);
  separator1 = new root.GenericSeparatorView(230).view;
  separator2 = new root.GenericSeparatorView(265).view;
  root.oneDealView.add(separator2);
}).call(this);

(function() {
  var bookingTab, currTab, infoTab, makeImageScroll, mapTab, photosTab, spacer, width;
  root.oneDealButtonBarView = Titanium.UI.createView({
    borderWidth: 0,
    top: 0,
    height: 40,
    backgroundColor: '#000'
  });
  spacer = Math.round(Ti.Platform.displayCaps.platformWidth * 0.25);
  width = spacer - 4;
  bookingTab = new root.GenericAndroidTab(width, '2', '#333', '#FFF', L('booking')).view;
  infoTab = new root.GenericAndroidTab(width, spacer, '#000', '#FFF', L('info')).view;
  mapTab = new root.GenericAndroidTab(width, spacer * 2, '#000', '#FFF', L('map')).view;
  photosTab = new root.GenericAndroidTab(width, spacer * 3, '#000', '#FFF', L('photos')).view;
  currTab = bookingTab;
  root.oneDealButtonBarView.add(bookingTab);
  root.oneDealButtonBarView.add(infoTab);
  root.oneDealButtonBarView.add(mapTab);
  root.oneDealButtonBarView.add(photosTab);
  makeImageScroll = function() {
    var image1, image2, image3, image4, image5, imagesScrollView;
    imagesScrollView = Titanium.UI.createScrollableView({
      showPagingControl: true,
      pagingControlHeight: 20
    });
    image1 = Titanium.UI.createImageView({
      top: 0,
      image: root.image1.image
    });
    image2 = Titanium.UI.createImageView({
      top: 0,
      image: root.image2.image
    });
    image3 = Titanium.UI.createImageView({
      top: 0,
      image: root.image3.image
    });
    image4 = Titanium.UI.createImageView({
      top: 0,
      image: root.image4.image
    });
    image5 = Titanium.UI.createImageView({
      top: 0,
      image: root.image5.image
    });
    imagesScrollView.addView(image1);
    imagesScrollView.addView(image2);
    imagesScrollView.addView(image3);
    imagesScrollView.addView(image4);
    imagesScrollView.addView(image5);
    imagesScrollView.currentPage = 0;
    return root.imagesWindow.add(imagesScrollView);
  };
  root.imagesWindow.addEventListener('blur', function(e) {
    return photosTab.backgroundColor = '#000';
  });
  bookingTab.addEventListener('click', function(e) {
    currTab.backgroundColor = '#000';
    this.backgroundColor = '#333';
    this.children[0].color = '#FFF';
    currTab = this;
    root.oneDealWindow.remove(root.infoDealTable);
    root.oneDealWindow.remove(root.mapView);
    return root.oneDealWindow.add(root.oneDealView);
  });
  infoTab.addEventListener('click', function(e) {
    currTab.backgroundColor = '#000';
    this.backgroundColor = '#333';
    this.children[0].color = '#FFF';
    currTab = this;
    root.oneDealWindow.remove(root.oneDealView);
    root.oneDealWindow.remove(root.mapView);
    return root.oneDealWindow.add(root.infoDealTable);
  });
  mapTab.addEventListener('click', function(e) {
    currTab.backgroundColor = '#000';
    this.backgroundColor = '#333';
    this.children[0].color = '#FFF';
    currTab = this;
    root.oneDealWindow.remove(root.oneDealView);
    root.oneDealWindow.remove(root.infoDealTable);
    return root.oneDealWindow.add(root.mapView);
  });
  photosTab.addEventListener('click', function(e) {
    photosTab.backgroundColor = '#333';
    makeImageScroll();
    root.tabGroup.activeTab.open(root.imagesWindow, {
      animated: true
    });
    return photosTab.backgroundColor = '#000';
  });
}).call(this);
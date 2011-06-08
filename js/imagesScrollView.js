(function() {
  root.imagesScrollView = Titanium.UI.createScrollableView({
    showPagingControl: true,
    pagingControlHeight: 40
  });
  root.image1 = Titanium.UI.createImageView({
    top: 0,
    width: 320,
    height: 460
  });
  root.image2 = Titanium.UI.createImageView({
    top: 0,
    width: 320,
    height: 460
  });
  root.image3 = Titanium.UI.createImageView({
    top: 0,
    width: 320,
    height: 460
  });
  root.image4 = Titanium.UI.createImageView({
    top: 0,
    width: 320,
    height: 460
  });
  root.image5 = Titanium.UI.createImageView({
    top: 0,
    width: 320,
    height: 460
  });
  root.imagesScrollView.addView(root.image2);
  root.imagesScrollView.addView(root.image3);
  root.imagesScrollView.addView(root.image4);
  root.imagesScrollView.addView(root.image5);
  root.imagesScrollView.addView(root.image1);
  root.imagesRemove = function() {
    root.imagesScrollView.removeView(root.image2);
    root.imagesScrollView.removeView(root.image3);
    root.imagesScrollView.removeView(root.image4);
    root.imagesScrollView.removeView(root.image5);
    return root.imagesScrollView.removeView(root.image1);
  };
  root.imagesAdd = function() {
    root.imagesScrollView.addView(root.image2);
    root.imagesScrollView.addView(root.image3);
    root.imagesScrollView.addView(root.image4);
    root.imagesScrollView.addView(root.image5);
    return root.imagesScrollView.addView(root.image1);
  };
}).call(this);

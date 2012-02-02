(function() {

  root.aboutScrollView = Titanium.UI.createScrollView({
    contentWidth: 'auto',
    contentHeight: 'auto',
    top: 0,
    showVerticalScrollIndicator: true
  });

  root.aboutWindow.add(root.aboutScrollView);

}).call(this);

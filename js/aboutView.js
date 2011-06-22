(function() {
  var aboutScrollView, aboutText, aboutTitle, aboutView;
  aboutScrollView = Titanium.UI.createScrollView({
    contentWidth: 'auto',
    contentHeight: 'auto',
    top: 0,
    showVerticalScrollIndicator: true
  });
  aboutTitle = L('aboutTitle');
  aboutText = L('aboutText');
  aboutView = new root.GenericTextView(0, aboutTitle, aboutText).view;
  aboutScrollView.add(aboutView);
  root.aboutWindow.add(aboutScrollView);
}).call(this);

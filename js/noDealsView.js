(function() {
  var closedView, text, title;

  root.noDealsView = Titanium.UI.createView({
    backgroundImage: '/images/Texture.jpg'
  });

  title = L('noDealsTitle');

  text = L('noDealsText');

  closedView = new root.GenericTextView(0, title, text).view;

  root.noDealsView.add(closedView);

  root.noDealsWindow.add(root.noDealsView);

}).call(this);

(function() {
  var closedView, text, title;
  root.noDealsView = Titanium.UI.createView({
    backgroundColor: '#0d1e28',
    width: 320
  });
  title = L('noDealsTitle');
  text = L('noDealsText');
  closedView = new root.GenericTextView(0, title, text).view;
  root.noDealsView.add(closedView);
  root.listDealsWindow.add(root.noDealsView);
  root.noDealsView.hide();
}).call(this);

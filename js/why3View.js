(function() {
  var text, title, why3View;

  root.why3View = Titanium.UI.createView({
    backgroundColor: '#0d1e28'
  });

  title = L('why3TitleShort');

  text = L('why3Text');

  why3View = new root.GenericTextView(0, title, text).view;

  root.why3View.add(why3View);

  root.why3Window.add(root.why3View);

}).call(this);

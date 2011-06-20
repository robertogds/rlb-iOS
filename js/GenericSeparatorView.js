(function() {
  var GenericSeparatorView;
  GenericSeparatorView = (function() {
    function GenericSeparatorView(top) {
      this.view = Titanium.UI.createView({
        backgroundColor: '#57585b',
        top: top,
        height: 1,
        width: 320
      });
    }
    return GenericSeparatorView;
  })();
  root.GenericSeparatorView = GenericSeparatorView;
}).call(this);

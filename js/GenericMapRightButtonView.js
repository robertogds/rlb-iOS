(function() {
  var GenericMapRightButtonView;
  GenericMapRightButtonView = (function() {
    function GenericMapRightButtonView(deal) {
      this.view = Titanium.UI.createView({
        backgroundImage: '/images/blue_arrow.png',
        height: 20,
        width: 20,
        deal: deal
      });
    }
    return GenericMapRightButtonView;
  })();
  root.GenericMapRightButtonView = GenericMapRightButtonView;
}).call(this);

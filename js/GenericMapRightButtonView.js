(function() {
  var GenericMapRightButtonView;

  GenericMapRightButtonView = (function() {

    function GenericMapRightButtonView(deal) {
      this.view = Titanium.UI.createView({
        borderWidth: 0,
        borderColor: 'red',
        backgroundImage: '/images/icon_blue_map.png',
        height: 40,
        width: 60,
        deal: deal
      });
    }

    return GenericMapRightButtonView;

  })();

  root.GenericMapRightButtonView = GenericMapRightButtonView;

}).call(this);

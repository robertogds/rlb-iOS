(function() {
  var GenericButton;

  GenericButton = (function() {

    function GenericButton(top, title) {
      this.button = Titanium.UI.createButton({
        backgroundImage: '/images/BUTT_drk_off.png',
        backgroundSelectedImage: '/images/BUTT_drk_on.png',
        backgroundDisabledImage: '/images/BUTT_drk_off.png',
        color: '#fff',
        title: title,
        width: 220,
        height: 40,
        font: {
          fontSize: 20,
          fontWeight: 'bold',
          fontFamily: 'Helvetica Neue'
        },
        top: top
      });
    }

    return GenericButton;

  })();

  root.GenericButton = GenericButton;

}).call(this);

(function() {
  var GenericNightView;

  GenericNightView = (function() {

    function GenericNightView(id, top, left) {
      this.view = Titanium.UI.createView({
        visible: false,
        id: id,
        borderWidth: 1,
        borderColor: 'black',
        backgroundColor: '#c2c1c1',
        left: left,
        height: 100,
        width: 90,
        top: top,
        backgroundGradient: {
          type: 'linear',
          colors: [
            {
              color: '#ededed',
              position: 0.1
            }, {
              color: '#c2c1c1',
              position: 1.0
            }
          ]
        }
      });
      this.dayOfWeekLabel = Titanium.UI.createLabel({
        textAlign: 'center',
        color: '#000',
        font: {
          fontSize: 14,
          fontWeight: 'bold'
        },
        top: 10,
        height: 20
      });
      this.dateLabel = Titanium.UI.createLabel({
        textAlign: 'center',
        color: '#000',
        font: {
          fontSize: 14
        },
        top: 30,
        height: 20
      });
      this.priceLabel = Titanium.UI.createLabel({
        textAlign: 'center',
        color: '#000',
        font: {
          fontSize: 20,
          fontWeight: 'bold'
        },
        top: 60,
        height: 25
      });
      this.view.add(this.dayOfWeekLabel);
      this.view.add(this.dateLabel);
      this.view.add(this.priceLabel);
    }

    return GenericNightView;

  })();

  root.GenericNightView = GenericNightView;

}).call(this);

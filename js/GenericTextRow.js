(function() {
  var GenericTextRow;

  GenericTextRow = (function() {

    function GenericTextRow() {
      this.row = Ti.UI.createTableViewRow({
        hasChild: false,
        identionLevel: 10,
        selectionStyle: 'none',
        color: '#fff',
        backgroundGradient: {
          type: 'linear',
          colors: [
            {
              color: '#07151d',
              position: 0.1
            }, {
              color: '#0d1e28',
              position: 1.0
            }
          ]
        }
      });
    }

    return GenericTextRow;

  })();

  root.GenericTextRow = GenericTextRow;

}).call(this);

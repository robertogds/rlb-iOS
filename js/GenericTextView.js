(function() {
  var GenericTextView;
  GenericTextView = (function() {
    function GenericTextView(top, title, text) {
      var textLabel, titleLabel;
      this.view = Titanium.UI.createView({
        backgroundImage: 'images/background1.png',
        borderWidth: 0,
        width: 320,
        top: top
      });
      titleLabel = Titanium.UI.createLabel({
        text: title,
        height: 30,
        top: 20,
        color: '#fff',
        left: 10,
        font: {
          fontSize: 20,
          fontWeight: 'bold'
        }
      });
      textLabel = Titanium.UI.createLabel({
        text: text,
        borderWidth: 0,
        top: 60,
        height: 'auto',
        color: '#fff',
        left: 10,
        right: 10,
        font: {
          fontSize: 14
        }
      });
      this.view.add(titleLabel);
      this.view.add(textLabel);
    }
    return GenericTextView;
  })();
  root.GenericTextView = GenericTextView;
}).call(this);

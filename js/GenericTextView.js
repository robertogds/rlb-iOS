(function() {
  var GenericTextView;

  GenericTextView = (function() {

    function GenericTextView(top, title, text) {
      this.view = Titanium.UI.createView({
        backgroundImage: '/images/Texture.jpg',
        borderWidth: 0,
        height: 'auto',
        top: top
      });
      this.titleLabel = Titanium.UI.createLabel({
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
      this.textLabel = Titanium.UI.createLabel({
        text: text + '\n\n',
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
      this.view.add(this.titleLabel);
      this.view.add(this.textLabel);
    }

    return GenericTextView;

  })();

  root.GenericTextView = GenericTextView;

}).call(this);

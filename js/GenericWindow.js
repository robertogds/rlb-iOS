(function() {
  var GenericWindow;
  GenericWindow = (function() {
    function GenericWindow(theTitle, theText) {
      var label;
      this.win = Ti.UI.createWindow({
        title: theTitle,
        backgroundColor: '#0d1e28'
      });
      label = Titanium.UI.createLabel({
        color: '#000',
        text: theText,
        font: {
          fontSize: 20,
          fontFamily: 'Helvetica Neue'
        },
        textAlign: 'center',
        width: 'auto'
      });
      this.win.add(label);
    }
    return GenericWindow;
  })();
  root.GenericWindow = GenericWindow;
}).call(this);

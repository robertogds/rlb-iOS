(function() {
  var GenericWindow;
  GenericWindow = (function() {
    function GenericWindow(theTitle, theText) {
      var label;
      this.win = Ti.UI.createWindow({
        title: theTitle,
        backgroundColor: '#fff'
      });
      label = Titanium.UI.createLabel({
        color: '#999',
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

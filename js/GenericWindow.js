(function() {
  var GenericWindow;
  GenericWindow = (function() {
    function GenericWindow(theTitle) {
      this.win = Ti.UI.createWindow({
        title: theTitle,
        backgroundImage: '/images/texture1.jpg'
      });
    }
    return GenericWindow;
  })();
  root.GenericWindow = GenericWindow;
}).call(this);

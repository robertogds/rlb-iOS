(function() {
  var GenericWindow;
  GenericWindow = function() {
    function GenericWindow(theTitle) {
      this.win = Ti.UI.createWindow({
        title: theTitle,
        backgroundColor: '#0d1e28'
      });
    }
    return GenericWindow;
  }();
  root.GenericWindow = GenericWindow;
}).call(this);

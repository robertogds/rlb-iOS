(function() {
  var GenericAndroidTab;

  GenericAndroidTab = (function() {

    function GenericAndroidTab(width, left, colorTab, colorLabel, text) {
      Ti.API.info('Entra con width = ' + width);
      this.view = Titanium.UI.createView({
        width: width,
        height: 36,
        left: left,
        bottom: 2,
        backgroundColor: colorTab,
        borderRadius: 2
      });
      this.label = Ti.UI.createLabel({
        text: text,
        color: colorLabel
      });
      this.view.add(this.label);
    }

    return GenericAndroidTab;

  })();

  root.GenericAndroidTab = GenericAndroidTab;

}).call(this);

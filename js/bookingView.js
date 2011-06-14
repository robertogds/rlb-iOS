(function() {
  Ti.include('js/confirmButton.js', 'js/bookingAction.js', 'js/expiresView.js', 'js/cardTypeView.js', 'js/creditCardTable.js');
  root.bookingView = Titanium.UI.createView({
    background: 'transparent',
    borderWidth: 0,
    width: 320,
    top: 0
  });
  root.bookingView.add(root.confirmButton);
  root.confirmBookingWindow.add(root.bookingView);
  root.showBookingView = function() {
    if (Titanium.App.Properties.hasProperty("user")) {
      root.creditCardData[0] = root.creditCardSection;
      root.creditCardTable.data = root.creditCardData;
      root.bookingView.add(root.creditCardTable);
      root.confirmBookingWindow.add(root.bookingView);
      root.tabGroup.activeTab.open(root.confirmBookingWindow, {
        animated: true
      });
    } else {
      root.tabGroup.activeTab.open(root.accountWindow, {
        animated: true
      });
    }
    return 1;
  };
}).call(this);

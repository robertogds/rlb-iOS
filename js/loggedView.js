(function() {
  Ti.include('/js/logoutButton.js');
  root.loggedView = Titanium.UI.createView({
    background: "transparent",
    borderWidth: 0,
    width: 320,
    top: 1
  });
  root.loggedLabel = Titanium.UI.createLabel({
    borderWidth: 0,
    color: '#fff',
    left: 5,
    font: {
      fontSize: 14,
      fontWeight: 'bold'
    },
    height: 30,
    width: 300,
    top: 1
  });
  root.loggedView.add(root.loggedLabel);
  root.loggedView.add(root.logoutButton);
}).call(this);

(function() {
  var rlbTeamImage;

  root.testView = Titanium.UI.createView({
    background: 'transparent',
    borderWidth: 0,
    width: 320,
    top: 0
  });

  rlbTeamImage = Titanium.UI.createImageView({
    image: '/images/rlb_team.jpg'
  });

  root.testView.add(rlbTeamImage);

  root.testWindow.add(root.testView);

}).call(this);

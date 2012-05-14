(function() {
  var acercaView, emailIcon, facebookIcon, legalView, socialView, twitterIcon, versionLabel;

  Ti.include('/js/supportView.js', '/js/testWindow.js');

  root.optionsView = Titanium.UI.createView({
    background: 'transparent',
    borderWidth: 0,
    top: 0
  });

  versionLabel = Titanium.UI.createLabel({
    borderWidth: 1,
    borderColor: '#868d92',
    backgroundColor: '#16232b',
    borderRadius: 5,
    text: 'Version: ' + Titanium.App.version,
    color: '#868d92',
    textAlign: 'center',
    font: {
      fontSize: 14
    },
    height: 20,
    width: 120,
    top: 340
  });

  versionLabel.addEventListener('click', function(e) {
    Ti.API.info('Hace clic en version');
    return root.tabGroup.activeTab.open(root.testWindow, {
      animated: true
    });
  });

  socialView = Titanium.UI.createView({
    top: 270,
    height: 80
  });

  twitterIcon = Titanium.UI.createImageView({
    image: '/images/twitter_share.png',
    height: 22,
    width: 60,
    top: 10,
    left: 50
  });

  facebookIcon = Titanium.UI.createImageView({
    image: '/images/facebook_share.png',
    height: 22,
    width: 60,
    left: 120,
    top: 10
  });

  emailIcon = Titanium.UI.createImageView({
    image: '/images/email_share.png',
    height: 21,
    width: 57,
    top: 10,
    left: 190
  });

  twitterIcon.addEventListener('click', function(e) {
    return root.sharekit.share({
      title: 'ReallyLateBooking',
      text: L('shareRLBTwitter'),
      sharer: 'Twitter'
    });
  });

  facebookIcon.addEventListener('click', function(e) {
    var data;
    data = {
      link: "http://www.reallylatebooking.com",
      name: 'ReallyLateBooking',
      caption: "reallylatebooking.com",
      description: L('shareRLBFacebook')
    };
    Titanium.Facebook.dialog("feed", data, function(e) {
      if (e.success) {} else {
        if (e.error) return alert(e.error);
      }
    });
    return root.sharekit.share({
      title: 'ReallyLateBooking',
      text: L('shareRLBFacebook'),
      sharer: 'Facebook'
    });
  });

  emailIcon.addEventListener('click', function(e) {
    var emailDialog;
    emailDialog = Titanium.UI.createEmailDialog();
    emailDialog.subject = L('shareRLBEmailSubject');
    emailDialog.messageBody = L('shareRLBEmail');
    return emailDialog.open();
  });

  socialView.add(facebookIcon);

  socialView.add(twitterIcon);

  socialView.add(emailIcon);

  acercaView = new root.Generic2RowsView(20, L('aboutRLB'), L('toHotels'));

  legalView = new root.Generic2RowsView(150, L('terms'), L('privacyPolicy'));

  acercaView.label1.addEventListener('click', function(e) {
    var aboutView;
    aboutView = new root.GenericTextView(0, L('aboutTitle'), L('aboutText')).view;
    root.aboutScrollView.add(aboutView);
    return root.tabGroup.activeTab.open(root.aboutWindow, {
      animated: true
    });
  });

  acercaView.label2.addEventListener('click', function(e) {
    return root.tabGroup.activeTab.open(root.forHotelsWindow, {
      animated: true
    });
  });

  legalView.label1.addEventListener('click', function(e) {
    return root.showTerms();
  });

  legalView.label2.addEventListener('click', function(e) {
    return root.showPrivacy();
  });

  root.optionsView.add(acercaView.view);

  root.optionsView.add(legalView.view);

  root.optionsView.add(versionLabel);

  root.optionsView.add(socialView);

  root.optionsWindow.add(root.optionsView);

}).call(this);

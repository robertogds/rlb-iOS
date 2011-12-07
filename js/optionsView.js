(function() {
  var acercaView, emailIcon, facebookIcon, legalView, socialView, twitterIcon, versionLabel;
  Ti.include('/js/supportView.js');
  root.optionsView = Titanium.UI.createView({
    background: 'transparent',
    borderWidth: 0,
    top: 0
  });
  versionLabel = Titanium.UI.createLabel({
    borderWidth: 1,
    borderColor: '#868d92',
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
  socialView = Titanium.UI.createView({
    top: 270,
    height: 80
  });
  facebookIcon = Titanium.UI.createImageView({
    image: '/images/facebook_share.png',
    height: 22,
    width: 60,
    left: 50,
    top: 10
  });
  twitterIcon = Titanium.UI.createImageView({
    image: '/images/twitter_share.png',
    height: 22,
    width: 60,
    top: 10,
    left: 130
  });
  emailIcon = Titanium.UI.createImageView({
    image: '/images/email_share.png',
    height: 21,
    width: 57,
    top: 10,
    left: 210
  });
  twitterIcon.addEventListener('click', function(e) {
    Titanium.Analytics.featureEvent('share.tweet.generic');
    return root.sharekit.share({
      title: 'ReallyLateBooking',
      text: L('shareRLBTwitter'),
      sharer: 'Twitter'
    });
  });
  facebookIcon.addEventListener('click', function(e) {
    Titanium.Analytics.featureEvent('share.facebook.generic');
    return root.sharekit.share({
      title: 'ReallyLateBooking',
      text: L('shareRLBFacebook'),
      sharer: 'Facebook'
    });
  });
  emailIcon.addEventListener('click', function(e) {
    var emailDialog;
    Titanium.Analytics.featureEvent('share.email.generic');
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

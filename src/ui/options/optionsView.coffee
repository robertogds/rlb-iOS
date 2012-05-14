Ti.include(
	'/js/supportView.js'
	'/js/testWindow.js'
)
root.optionsView = Titanium.UI.createView
  background: 'transparent'
  borderWidth: 0
  top: 0

versionLabel = Titanium.UI.createLabel
  borderWidth: 1
  borderColor: '#868d92'
  backgroundColor: '#16232b'
  borderRadius: 5
  text: 'Version: ' + Titanium.App.version
  color: '#868d92'
  textAlign: 'center'
  font:
    fontSize: 14
    #fontWeight: 'bold'
  height: 20
  width: 120
  top: 340


versionLabel.addEventListener 'click', (e) ->
	Ti.API.info 'Hace clic en version'
	root.tabGroup.activeTab.open(root.testWindow,{animated:true})
	
socialView = Titanium.UI.createView
  top: 270
  height: 80


twitterIcon =  Titanium.UI.createImageView
  image:'/images/twitter_share.png'
  height: 22
  width: 60
  top: 10
  left: 50

facebookIcon = Titanium.UI.createImageView
  image:'/images/facebook_share.png'
  height: 22
  width: 60
  left: 120
  top: 10

emailIcon =  Titanium.UI.createImageView
  image:'/images/email_share.png'
  height: 21
  width: 57
  top: 10
  left: 190


twitterIcon.addEventListener 'click', (e) ->
	root.sharekit.share
		title: 'ReallyLateBooking'
		text: L('shareRLBTwitter')
		sharer: 'Twitter'
	
facebookIcon.addEventListener 'click', (e) ->
	data = 
		link: "http://www.reallylatebooking.com"
		name: 'ReallyLateBooking'
		caption: "reallylatebooking.com"
		description: L('shareRLBFacebook')
	Titanium.Facebook.dialog "feed", data, (e) ->
		if (e.success) 
			#alert("Success!  From FB: " + e.result)
		else 
			if (e.error) 
				alert(e.error)
	root.sharekit.share
		title: 'ReallyLateBooking'
		text: L('shareRLBFacebook')
		sharer: 'Facebook'
		
emailIcon.addEventListener 'click', (e) ->
	emailDialog = Titanium.UI.createEmailDialog()
	emailDialog.subject = L('shareRLBEmailSubject')
	emailDialog.messageBody = L('shareRLBEmail')
	emailDialog.open()

socialView.add(facebookIcon)
socialView.add(twitterIcon)
socialView.add(emailIcon)

acercaView = new root.Generic2RowsView(20,L('aboutRLB'),L('toHotels'))
legalView = new root.Generic2RowsView(150,L('terms'),L('privacyPolicy'))

acercaView.label1.addEventListener 'click', (e) ->
  aboutView =  new root.GenericTextView(0,L('aboutTitle'),L('aboutText')).view
  root.aboutScrollView.add(aboutView)
  root.tabGroup.activeTab.open(root.aboutWindow,{animated:true})

acercaView.label2.addEventListener 'click', (e) ->
  root.tabGroup.activeTab.open(root.forHotelsWindow,{animated:true})

legalView.label1.addEventListener 'click', (e) ->
  root.showTerms()

legalView.label2.addEventListener 'click', (e) ->
  root.showPrivacy()


root.optionsView.add(acercaView.view)
root.optionsView.add(legalView.view)
root.optionsView.add(versionLabel)
root.optionsView.add(socialView)
root.optionsWindow.add(root.optionsView)
Ti.include(
  '/js/supportView.js'
)
root.optionsView = Titanium.UI.createView
  background: 'transparent'
  borderWidth: 0
  top: 0

versionLabel = Titanium.UI.createLabel
  borderWidth: 0
  text: 'Version: ' + Titanium.App.version
  color: '#868d92'
  textAlign: 'center'
  font:
    fontSize: 14
    #fontWeight: 'bold'
  height: 30
  width: 300
  top: 340


socialView = Titanium.UI.createView
  top: 270
  height: 80

facebookIcon = Titanium.UI.createImageView
  image:'icons/facebook.png'
  height: 24
  width: 24
  left: 40
  top: 1

twitterIcon =  Titanium.UI.createImageView
  image:'icons/twitter.png'
  height: 24
  width: 24
  top: 30
  left: 40

facebookLabel = Titanium.UI.createLabel
  text: 'facebook.com/reallylatebooking'
  color: '#fff'
  font:
    fontSize: 14
    fontWeight: 'bold'
  height: 20
  top: 1
  left: 70

twitterLabel = Titanium.UI.createLabel
  text: '@rlatebooking'
  color: '#fff'
  font:
    fontSize: 14
    fontWeight: 'bold'
  height: 20
  top: 30
  left: 70

socialView.add(facebookIcon)
socialView.add(facebookLabel)
socialView.add(twitterIcon)
socialView.add(twitterLabel)


acercaView = new root.Generic2RowsView(20,L('aboutRLB'),L('toHotels'))
legalView = new root.Generic2RowsView(150,L('terms'),L('privacyPolicy'))

acercaView.label1.addEventListener 'click', (e) ->
  root.tabGroup.activeTab.open(root.aboutWindow,{animated:true})

acercaView.label2.addEventListener 'click', (e) ->
  root.tabGroup.activeTab.open(root.forHotelsWindow,{animated:true})

legalView.label1.addEventListener 'click', (e) ->
  root.showTerms()

legalView.label2.addEventListener 'click', (e) ->
  root.showPrivacy()

root.optionsView.add(socialView)
root.optionsView.add(acercaView.view)
root.optionsView.add(legalView.view)
root.optionsView.add(versionLabel)
root.optionsWindow.add(root.optionsView)
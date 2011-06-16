Ti.include(
  '/js/supportView.js'
)
root.configView = Titanium.UI.createView
  background: 'transparent'
  borderWidth: 0
  width:320
  top: 0

versionLabel = Titanium.UI.createLabel
  borderWidth: 0
  text: 'Version: ' + Titanium.App.version
  color: '#fff'
  textAlign: 'center'
  font:
    fontSize: 14
    #fontWeight: 'bold'
  height: 30
  width: 300
  top: 300


acercaView = new root.Generic2RowsView(20,'Acerca de ReallyLateBooking','Para los Hoteles')
legalView = new root.Generic2RowsView(150,'Términos de uso','Política de privacidad')

acercaView.label1.addEventListener 'click', (e) ->
  root.tabGroup.activeTab.open(root.aboutWindow,{animated:true})

acercaView.label2.addEventListener 'click', (e) ->
  root.tabGroup.activeTab.open(root.forHotelsWindow,{animated:true})

legalView.label1.addEventListener 'click', (e) ->
  root.showTerms()

legalView.label2.addEventListener 'click', (e) ->
  root.showPrivacy()


root.configView.add(acercaView.view)
root.configView.add(legalView.view)
root.configView.add(versionLabel)
root.configWindow.add(root.configView)
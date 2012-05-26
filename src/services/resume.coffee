root.startupWindow = Ti.UI.createWindow
	height: "100%"
	width: "100%"
	backgroundColor:'#000'
	navBarHidden: true
	zIndex:1

loadLabel = Titanium.UI.createLabel
  textAlign: 'center'
  height: 50
  width: 120
  borderWidth: 0
  top: 370
  text: L('updatingHotels')
  color: '#858C92'
  font:
    fontSize: 12
    fontWeight: 'bold'

startupView =Titanium.UI.createImageView
	image:'Default.png'
	top:-20.0

actInd = Titanium.UI.createActivityIndicator
	style:Titanium.UI.iPhone.ActivityIndicatorStyle.SMALL
	top:420

actInd.show()

startupAnimation = Titanium.UI.createAnimation
	curve: Ti.UI.ANIMATION_CURVE_EASE_IN_OUT
	opacity: 0.4
	duration: 3000
	
root.startupWindow.add(startupView)
startupView.add(actInd)
startupView.add(loadLabel)

root.startupWindow.open
	navBarHidden:false
#startupView.animate(startupAnimation)


startupAnimation.addEventListener 'complete', (e) ->
	root.tabGroup.open()
	root.startupWindow.close()


#Ti.App.addEventListener 'resume', (e)->
#	alert 'Hubo resume'
 
#Ti.App.addEventListener 'pause', (e)->
#	alert 'Hubo Pause'
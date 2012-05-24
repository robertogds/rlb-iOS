root.blockView = Titanium.UI.createView
	backgroundColor: 'transparent'
	height: '100%'
	witdh: '100%'
	
root.loadingView = Titanium.UI.createView
  backgroundColor: '#000'
  borderWidth: 0
  borderRadius: 10
  opacity: 0.8
  width:140
  height:150
  top: '30%'

root.loadLabel = Titanium.UI.createLabel
  textAlign: 'center'
  height: 50
  width: 120
  borderWidth: 0
  top: 12
  text: Ti.Locale.getString('loading')
  color: '#fff'
  font:
    fontSize: 16
    fontWeight: 'bold'


root.iphoneActInd = Titanium.UI.createActivityIndicator
	style:Titanium.UI.iPhone.ActivityIndicatorStyle.BIG
	top:70

root.androidActInd = Titanium.UI.createActivityIndicator
	height:50
	width:10
	message: Ti.Locale.getString('loading')


root.loadingView.add(root.loadLabel)
root.loadingView.add(root.iphoneActInd)
root.blockView.add(root.loadingView)
root.iphoneActInd.show()

root.showLoading = (window,text) ->
  if text isnt undefined
    root.loadLabel.text = text
  else
    root.loadLabel.text = Ti.Locale.getString('loading')
  if (Titanium.Platform.name == 'android') 
    root.androidActInd.show()
  else
    window.add(root.blockView)


root.hideLoading = (window) ->
  if (Titanium.Platform.name == 'android') 
    root.androidActInd.hide()  
  else
    window.remove(root.blockView)
    


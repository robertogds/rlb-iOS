root.loadingView = Titanium.UI.createView
  backgroundColor: '#000'
  borderWidth: 0
  borderRadius: 10
  opacity: 0.8
  width:140
  height:100
  top: '30%'

root.loadLabel = Titanium.UI.createLabel
  textAlign: 'center'
  height: 20
  width: 80
  borderWidth: 0
  top: 4
  text: Ti.Locale.getString('loading')
  color: '#fff'
  font:
    fontSize: 14
    fontWeight: 'bold'


root.iphoneActInd = Titanium.UI.createActivityIndicator
  height:50
  width:10
  top:25

root.androidActInd = Titanium.UI.createActivityIndicator
  height:50
  width:10
  message: Ti.Locale.getString('loading')


root.loadingView.add(root.loadLabel)
root.loadingView.add(root.iphoneActInd)
root.iphoneActInd.show()

root.showLoading = (window) ->
  if (Titanium.Platform.name == 'android') 
    root.androidActInd.show()
  else
    window.add(root.loadingView)


root.hideLoading = (window) ->
  if (Titanium.Platform.name == 'android') 
    root.androidActInd.hide()  
  else
    window.remove(root.loadingView)
    


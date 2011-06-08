root.loadingView = Titanium.UI.createView
  backgroundColor: '#000'
  borderWidth: 0
  borderRadius: 10
  opacity: 0.8
  width:120
  height:80
  top: 150

root.loadLabel = Titanium.UI.createLabel
  textAlign: 'center'
  height: 20
  width: 80
  borderWidth: 0
  top: 4
  text: 'Cargando'
  color: '#fff'
  font:
    fontSize: 11
    fontWeight: 'bold'


root.actInd = Titanium.UI.createActivityIndicator
  height:50
  width:10
  top:25

root.loadingView.add(root.loadLabel)
root.loadingView.add(root.actInd)
root.actInd.show()


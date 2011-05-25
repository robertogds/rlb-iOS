root.infoScrollView = Titanium.UI.createScrollView
  contentWidth:'auto'
  contentHeight:'auto'
  top: 25
  showVerticalScrollIndicator:true

root.infoView = Titanium.UI.createView
  background: 'transparent'
  borderWidth: 0
  width:320
  height: 620
  top: 0


root.whyLabel = Titanium.UI.createLabel
  top: 10
  color: '#fff'
  left: 5
  width: 315
  height: 200
  font:
    fontSize: 14


#root.infoView.add(root.oneDealButtonBar)
root.infoView.add(root.whyLabel)
root.infoScrollView.add(root.infoView)

root.infoDealScrollView = Titanium.UI.createScrollView
  contentWidth:'auto'
  contentHeight:'auto'
  top: 25
  showVerticalScrollIndicator:true

root.infoDealView = Titanium.UI.createView
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


root.infoDealView.add(root.whyLabel)
root.infoDealScrollView.add(root.infoDealView)

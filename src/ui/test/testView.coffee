root.testView = Titanium.UI.createView
  background: 'transparent'
  borderWidth: 0
  width:320
  top: 0

bb1 = Titanium.UI.createButtonBar
  labels:['One', 'Two', 'Three']
  backgroundColor:'#000'
  top:50
  style:Titanium.UI.iPhone.SystemButtonStyle.BAR
  height:25
  width:200
root.testView.add(bb1)


root.testWindow.add(root.testView)

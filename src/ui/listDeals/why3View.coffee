root.why3View = Titanium.UI.createView
  backgroundColor: '#0d1e28'
  #width:320

title = L('why3Title')
text = L('why3Text')

why3View =  new root.GenericTextView(0,title,text).view

root.why3View.add(why3View)
root.why3Window.add(root.why3View)
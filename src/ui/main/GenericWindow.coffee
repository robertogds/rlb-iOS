class GenericWindow
  constructor: (theTitle, theText) ->
    @win = Ti.UI.createWindow({title:theTitle,backgroundColor:'#0b222e'})
    label = Titanium.UI.createLabel
      color: '#000'
      text: theText
      font: 
        fontSize: 20
        fontFamily: 'Helvetica Neue'
      textAlign: 'center'
      width: 'auto'
    @win.add(label)
 
root.GenericWindow = GenericWindow
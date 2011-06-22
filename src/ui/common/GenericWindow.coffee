class GenericWindow
  constructor: (theTitle) ->
    @win = Ti.UI.createWindow({title:theTitle,backgroundColor:'#0d1e28'})
root.GenericWindow = GenericWindow
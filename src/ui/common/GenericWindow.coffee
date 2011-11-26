class GenericWindow
  constructor: (theTitle) ->
    @win = Ti.UI.createWindow({title:theTitle,backgroundImage:'/images/texture1.jpg'})
root.GenericWindow = GenericWindow
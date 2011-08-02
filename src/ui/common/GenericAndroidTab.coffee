class GenericAndroidTab
  constructor: (width,left,colorTab,colorLabel,text) ->
    Ti.API.info 'Entra con width = ' + width
    @view = Titanium.UI.createView
      width:width
      height:36
      left:left
      bottom:2
      backgroundColor:colorTab
      borderRadius:2

    @label = Ti.UI.createLabel
      text:text
      color:colorLabel

    @view.add(@label)

root.GenericAndroidTab = GenericAndroidTab
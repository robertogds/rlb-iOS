class GenericTextView
  constructor: (top,title,text) ->
    @view = Titanium.UI.createView
      backgroundImage: 'images/background1.png'
      borderWidth: 0
      height: 'auto'
      width:320
      top: top

    @titleLabel = Titanium.UI.createLabel
      text: title
      height: 30
      top: 20
      color: '#fff'
      left: 10
      font:
        fontSize: 20
        fontWeight: 'bold'

    @textLabel = Titanium.UI.createLabel
      text: text
      borderWidth: 0
      top: 60
      height: 'auto'
      color: '#fff'
      left: 10
      right: 10
      font:
        fontSize: 14

    @view.add(@titleLabel)
    @view.add(@textLabel)

root.GenericTextView = GenericTextView
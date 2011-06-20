class GenericSeparatorView
  constructor: (top) ->
    @view = Titanium.UI.createView
      backgroundColor: '#57585b' 
      top: top
      height: 1
      width: 320

root.GenericSeparatorView = GenericSeparatorView
  
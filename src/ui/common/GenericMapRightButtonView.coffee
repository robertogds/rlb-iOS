class GenericMapRightButtonView
  constructor: (deal) ->
    @view = Titanium.UI.createView
      backgroundImage: '/images/blue_arrow.png'
      height:20
      width: 20
      deal: deal
root.GenericMapRightButtonView = GenericMapRightButtonView
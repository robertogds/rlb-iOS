class GenericTextRow
  constructor: () ->
    @row = Ti.UI.createTableViewRow
      hasChild: false
      identionLevel: 10
      height: 'auto'
      color: '#fff'
      backgroundGradient:
        type:'linear'
        colors:[{color:'#093344',position:0.1},{color:'#0b222e',position:0.50},{color:'#0c1b24',position:1.0}]


root.GenericTextRow = GenericTextRow
root.infoDealTable = Titanium.UI.createTableView
  data: []
  backgroundColor: '#0b222e'
  separatorColor: '#0b222e'

hotelRow = Ti.UI.createTableViewRow
    hasChild: false
    identionLevel: 200
    height: 'auto'
    backgroundGradient:
      type:'linear'
      colors:[{color:'#093344',position:0.1},{color:'#0b222e',position:0.50},{color:'#0c1b24',position:1.0}]
    color: '#fff'

hotelLabel = Titanium.UI.createLabel
  borderWidth: 0
  text: "Sobre el hotel"
    color: '#fff'
    left: 155
    font:
      fontSize: 14
      fontWeight: 'bold'
    height: 30
    width: 160
    top: 5
  @row.add(hotelLabel)



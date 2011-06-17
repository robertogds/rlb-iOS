root.infoDealTable = Titanium.UI.createTableView
  data: []
  backgroundColor: '#0b222e'
  separatorColor: '#0b222e'

hotelRow = Ti.UI.createTableViewRow
    hasChild: false
    identionLevel: 200
    height: 120
    backgroundGradient:
      type:'linear'
      colors:[{color:'#093344',position:0.1},{color:'#0b222e',position:0.50},{color:'#0c1b24',position:1.0}]
    fontSize: 6
    deal: deal
    color: '#fff'

  image = Titanium.UI.createImageView 
    image: deal.mainImageSmall
    borderRadius: 10
    borderColor: '#fff'
    borderWidth: 2
    left: 4
    width: 140
    height: 110
  @row.add(image)

  hotelLabel = Titanium.UI.createLabel
    borderWidth: 0
    text: deal.hotelName
    color: '#fff'
    left: 155
    font:
      fontSize: 14
      fontWeight: 'bold'
    height: 30
    width: 160
    top: 5
  @row.add(hotelLabel)



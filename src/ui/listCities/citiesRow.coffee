class CitiesRow
  constructor: (city) ->
    @row = Ti.UI.createTableViewRow
      hasChild: true
      city: city
      rightImage: '/images/yellow_arrow.png'
      backgroundGradient:
        type:'linear'
        #colors:[{color:'#093344',position:0.1},{color:'#0b222e',position:0.50},{color:'#0c1b24',position:1.0}]
        colors:[{color:'#07151d',position:0.1},{color:'#0d1e28',position:1.0}]
    
    cityLabel = Titanium.UI.createLabel
      text: city.name
      id:"titleText"
      color: '#fff'
      font:
        fontSize: 16
        fontWeight: 'bold'
      left: 10
    @row.add(cityLabel)

root.citiesRow = CitiesRow
class CountriesRow
  constructor: (country) ->
    @row = Ti.UI.createTableViewRow
      hasChild: true
      country: country
      rightImage: '/images/yellow_arrow.png'
      selectionStyle: 'none'
      backgroundGradient:
        type:'linear'
        colors:[{color:'#07151d',position:0.1},{color:'#0d1e28',position:1.0}]
    
    countryLabel = Titanium.UI.createLabel
      text: country.name
      id:"titleText"
      color: '#fff'
      font:
        fontSize: 16
        fontWeight: 'bold'
      left: 10
    @row.add(countryLabel)

root.countriesRow = CountriesRow
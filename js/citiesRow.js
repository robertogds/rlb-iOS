(function() {
  var CitiesRow;
  CitiesRow = (function() {
    function CitiesRow(city) {
      var cityLabel;
      this.row = Ti.UI.createTableViewRow({
        hasChild: true,
        city: city,
        backgroundGradient: {
          type: 'linear',
          colors: [
            {
              color: '#093344',
              position: 0.1
            }, {
              color: '#0b222e',
              position: 0.50
            }, {
              color: '#0c1b24',
              position: 1.0
            }
          ]
        }
      });
      cityLabel = Titanium.UI.createLabel({
        text: city.name,
        color: '#fff',
        font: {
          fontSize: 16,
          fontWeight: 'bold'
        },
        left: 10
      });
      this.row.add(cityLabel);
    }
    return CitiesRow;
  })();
  root.citiesRow = CitiesRow;
}).call(this);

(function() {
  var CitiesRow;
  CitiesRow = function() {
    function CitiesRow(city) {
      var cityLabel;
      this.row = Ti.UI.createTableViewRow({
        hasChild: true,
        city: city,
        rightImage: '/images/yellow_arrow.png',
        selectionStyle: 'none',
        backgroundGradient: {
          type: 'linear',
          colors: [
            {
              color: '#07151d',
              position: 0.1
            }, {
              color: '#0d1e28',
              position: 1.0
            }
          ]
        }
      });
      cityLabel = Titanium.UI.createLabel({
        text: city.name,
        id: "titleText",
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
  }();
  root.citiesRow = CitiesRow;
}).call(this);

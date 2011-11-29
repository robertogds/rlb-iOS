(function() {
  var CityRow;
  CityRow = (function() {
    function CityRow(row, city, left) {
      var cityBarLabel, cityImage, cityLabel;
      cityImage = Titanium.UI.createImageView({
        borderRadius: 0,
        borderWidth: 0,
        borderColor: 'black',
        image: city.image,
        city: city,
        left: left,
        width: 107,
        height: 107,
        open: false,
        top: 0
      });
      cityLabel = Titanium.UI.createLabel({
        text: city.name,
        color: 'white',
        textAlign: 'center',
        font: {
          fontSize: 13,
          fontWeight: 'bold'
        },
        left: left,
        height: 12,
        width: 107,
        top: 93
      });
      cityBarLabel = Titanium.UI.createLabel({
        borderWidth: 0,
        backgroundColor: 'black',
        opacity: 0.6,
        color: '#fff',
        left: left,
        height: 15,
        width: 107,
        top: 91
      });
      row.add(cityImage);
      row.add(cityBarLabel);
      row.add(cityLabel);
      cityImage.addEventListener('click', function(e) {
        city = e.source.city;
        root.showLoading(root.citiesWindow, L('updatingHotels'));
        return root.loadDeals(e.source.city);
      });
    }
    root.cityRow = CityRow;
    return CityRow;
  })();
}).call(this);

(function() {
  var CityRow;
  CityRow = (function() {
    function CityRow(row, city, left) {
      var cityBarLabel, cityImage, cityLabel;
      cityImage = Titanium.UI.createImageView({
        borderRadius: 0,
        borderWidth: 0,
        borderColor: 'white',
        image: city.image,
        city: city,
        left: left + 8,
        width: 100,
        height: 89,
        open: false,
        top: 2
      });
      cityLabel = Titanium.UI.createLabel({
        text: city.name,
        color: '#fff',
        textAlign: 'center',
        font: {
          fontSize: 11,
          fontWeight: 'bold'
        },
        left: left,
        height: 12,
        width: 80,
        top: 75
      });
      cityBarLabel = Titanium.UI.createLabel({
        borderWidth: 0,
        backgroundColor: 'black',
        opacity: 0.6,
        color: '#fff',
        left: left,
        height: 12,
        width: 80,
        top: 0
      });
      row.add(cityImage);
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

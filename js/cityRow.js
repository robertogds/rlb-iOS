(function() {
  var CityRow;
  CityRow = (function() {
    function CityRow(row, city, left) {
      var cityBarLabel, cityImage, cityLabel;
      cityImage = Titanium.UI.createImageView({
        borderRadius: 10,
        borderWidth: 0,
        borderColor: 'white',
        image: city.image,
        city: city,
        left: left + 10,
        width: 90,
        height: 68,
        open: false
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
        var zone, zoneRow, _i, _len, _ref;
        city = e.source.city;
        if (city.hasZones === true) {
          if (e.source.open === false) {
            e.source.open = true;
            e.source.borderWidth = 2;
            e.source.borderColor = 'black';
            row = Ti.UI.createTableViewRow({
              height: 120,
              backgroundColor: 'black'
            });
            left = 0;
            _ref = root.zones[city.url];
            for (_i = 0, _len = _ref.length; _i < _len; _i++) {
              zone = _ref[_i];
              zoneRow = new root.cityRow(row, zone, left);
              left = left + 80;
            }
            return root.citiesTable.insertRowAfter(1, row);
          } else {
            root.citiesTable.deleteRow(2);
            e.source.borderWidth = 1;
            e.source.borderColor = '#1b3c50';
            return e.source.open = false;
          }
        }
      });
    }
    root.cityRow = CityRow;
    return CityRow;
  })();
}).call(this);

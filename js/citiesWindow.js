(function() {
  Ti.include('/js/citiesRow.js', '/js/citiesTable.js');
  root.citiesWindow.addEventListener('focus', function(e) {
    root.currentWindow = 'cities';
    return root.showCities();
  });
}).call(this);

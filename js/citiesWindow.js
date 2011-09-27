(function() {
  Ti.include('/js/citiesRow.js', '/js/citiesTable.js');
  root.citiesWindow.addEventListener('focus', function(e) {
    var diffTime, now;
    root.currentWindow = 'cities';
    now = new Date();
    diffTime = now.getTime() - root.citiesDate.getTime();
    Ti.API.info('last cities updated: ' + root.citiesDate.toLocaleDateString() + 'difftime: ' + diffTime);
    if (diffTime > 86400000) {
      return root.showCities();
    }
  });
}).call(this);

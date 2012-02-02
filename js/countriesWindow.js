(function() {

  Ti.include('/js/countriesRow.js', '/js/countriesTable.js');

  root.countriesWindow.addEventListener('focus', function(e) {
    alert('Entra en fetch countries');
    return root.fetchCountries();
  });

}).call(this);

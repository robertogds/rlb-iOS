(function() {
  root.oneDealView.addEventListener('focus', function(e) {
    alert('Entra en focus');
    Ti.API.error("*** focus oneDeal");
    return 1;
  });
}).call(this);

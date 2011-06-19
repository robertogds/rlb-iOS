(function() {
  var text, title;
  title = 'Preparando las mejores ofertas';
  text = "Cada día negociamos las mejores ofertas con los hoteles, a las 12 del mediodía estarán disponibles en nuestro listado de ofertas\n\nVuelve más tarde para comprobar las ofertas de esta noche\ \n\n\n\n\n\n\n\n\n\n\n\n";
  root.noDealsView = new root.GenericTextView(0, title, text).view;
  root.noDealsView.backgroundImage = 'images/background1.png';
  root.listDealsWindow.add(root.noDealsView);
  root.noDealsView.hide();
}).call(this);

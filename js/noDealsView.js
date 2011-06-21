(function() {
  var closedView, text, title;
  root.noDealsView = Titanium.UI.createView({
    backgroundColor: 'transparent',
    width: 320
  });
  title = 'Preparando las mejores ofertas';
  text = "Cada día negociamos las mejores ofertas con los hoteles, a las 12 del mediodía estarán disponibles en nuestro listado de ofertas\n\nVuelve más tarde para comprobar las ofertas de esta noche";
  closedView = new root.GenericTextView(0, title, text).view;
  root.noDealsView.add(closedView);
  root.listDealsWindow.add(root.noDealsView);
  root.noDealsView.hide();
}).call(this);

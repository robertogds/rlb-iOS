root.noDealsView = Titanium.UI.createView
  backgroundImage: 'images/background1.png'
  width:320

title = 'Preparando las mejores ofertas'
text = "Cada día negociamos las mejores ofertas con los hoteles, a las 12 del mediodía estarán disponibles en nuestro listado de ofertas\n\n
Vuelve más tarde para comprobar las ofertas de esta noche"
# Ojo que esta vista tiene que ocupar la pantalla completa para ocultar los deals, por eso los espacios al final, es feo pero no encontré mejor solución

closedView =  new root.GenericTextView(0,title,text).view

root.noDealsView.add(closedView)
root.listDealsWindow.add(root.noDealsView)
root.noDealsView.hide()
title = 'Preparando las mejores ofertas'
text = "Cada día negociamos las mejores ofertas con los hoteles, a las 12 del mediodía estarán disponibles en nuestro listado de ofertas\n\n
Vuelve más tarde para comprobar las ofertas de esta noche\ \n\n\n\n\n\n\n\n\n\n\n\n"
# Ojo que esta vista tiene que ocupar la pantalla completa para ocultar los deals, por eso los espacios al final, es feo pero no encontré mejor solución

root.noDealsView =  new root.GenericTextView(0,title,text).view
root.noDealsView.backgroundImage =  'images/background1.png'
root.listDealsWindow.add(root.noDealsView)
root.noDealsView.hide()
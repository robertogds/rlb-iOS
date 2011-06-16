aboutScrollView = Titanium.UI.createScrollView
  contentWidth:'auto'
  contentHeight:'auto'
  top: 0
  showVerticalScrollIndicator:true

aboutTitle = 'La noche es joven'
aboutText = "Estás en un club a la 1am y quieres continuar la fiesta. Has tenido un lardo día en la oficina y estás demasiado cansado para conducir hasta casa.
Un cliente te necesita en Sevilla mañana y necesitas un luegar donde descansar\n\n
Los planes han cambiado. ReallyLateBooking te puede ayudar.\n\n
ReallyLateBooking ofrece increíbles descuentos en reservas en el mismo día para hoteles de calidad. Probalemente ya has estado en alguno de estos hoteles, pero ahora ReallyLateBooking te permitirá 
conseguir habitación a una fracción del precio que pagarías habitualmente.\n\n
¿Cómo podemos ofrecerte estos precios? Hemos llegado a acuerdos especiales con cada uno de los hoteles, los hoteles necesitan llenar sus habitaciones y nosotros nos ofrecemos para ayudarles
a cambio de que nos ofrezcan esas habitaciones que probablemente se iban a quedar vacías a un precio ridículo. Nosotros se lo propusimos, ellos aceptaron y todos contentos, especialmente como
podrás comprobar pronto, tú.\n\n
Si lo que buscas es pasar un largo fin de semana en un determinado hotel, ese no es nuestro negocio.\n\n
¿Necesitas un hotel para esta noche?. Entonces sí que podemos ayudarte.\nTenemos tres hoteles cada día para elegir en con tres catogrías de precio para cada una de las ciudades en las que trabajamos.\n
Reserva en el momento, desde cualquier sitio con tu móvil.\n
¡Consigue habitación, esta noche!"



aboutView =  new root.GenericTextView(0,aboutTitle,aboutText).view

aboutScrollView.add(aboutView)
root.aboutWindow.add(aboutScrollView)
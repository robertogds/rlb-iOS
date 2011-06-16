(function() {
  var forHotelsView, text, title;
  title = '¿Tienes un hotel?';
  text = 'Si tienes un hotel y quieres estar en la aplicación más innovadora de reservas de hoteles.\n\n';
  text = text + 'Ponte en contacto con nosotros';
  forHotelsView = new root.GenericTextView(0, title, text).view;
  root.forHotelsWindow.add(forHotelsView);
}).call(this);

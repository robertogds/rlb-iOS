(function() {
  var noBookingsView, text, title;
  root.noBookingsView = Titanium.UI.createView({
    backgroundColor: '#0d1e28',
    width: 320
  });
  title = '¿Reservar esta noche?';
  text = 'Todavía no has realizado ninguna reserva.\n\n';
  text = text + 'Cuando lo hayas hecho, podrás encontrar tus resguardos en esta sección para poder acceder a ellos de forma fácil cuando vayas al hotel\n\n\n';
  text = text + '¿Ya has hecho alguna reserva?\nVe a Opciones y entra con tu usuario';
  noBookingsView = new root.GenericTextView(0, title, text).view;
  root.noBookingsView.add(noBookingsView);
  root.bookingsWindow.add(root.noBookingsView);
}).call(this);

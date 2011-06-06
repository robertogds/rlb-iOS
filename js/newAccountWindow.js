(function() {
  root.newAccountWindow = new root.GenericWindow('Nueva Cuenta', 'Nueva Cuenta').win;
  root.newAccountWindow.addEventListener('open', function(e) {
    return alert('Se ha abierto la ventana new account');
  });
  root.newAccountWindow.addEventListener('focus', function(e) {
    return alert('new account window ha pillado el focus');
  });
}).call(this);

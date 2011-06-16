(function() {
  var text, title;
  root.errorCloseButton = Titanium.UI.createButton({
    backgroundImage: 'images/BUTT_gry_off.png',
    backgroundSelectedImage: 'images/BUTT_gry_on.png',
    backgroundDisabledImage: 'images/BUTT_drk_off.png',
    borderWidth: 1,
    color: '#000',
    title: 'Intentar de nuevo',
    width: 220,
    height: 40,
    font: {
      fontSize: 20,
      fontWeight: 'bold',
      fontFamily: 'Helvetica Neue'
    },
    top: 300
  });
  title = 'Se ha producido un error';
  text = 'La aplicación no puede cargar los datos necesarios.\n\n';
  text = text + 'Probablemente se trate de un problema de conexión a Internet o una caída temporal de nuestros servidores debido a un fallo o tareas de mantenimiento\n\n\n';
  text = text + 'Por favor vuelve a intentarlo en unos minutos';
  root.errorView = new root.GenericTextView(0, title, text).view;
  root.errorView.add(root.errorCloseButton);
  root.errorCloseButton.addEventListener('click', function(e) {
    root.errorWindow.remove(root.errorView);
    root.errorWindow.close();
    root.tabGroup.setActiveTab(0);
    root.showCities();
    return 1;
  });
}).call(this);

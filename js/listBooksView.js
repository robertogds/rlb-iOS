(function() {
  var booksText1Label, booksText2Label, booksText3Label, booksTitleLabel;
  root.listBooksView = Titanium.UI.createView({
    backgroundImage: 'images/background1.png',
    borderWidth: 0,
    width: 320,
    top: 0
  });
  booksTitleLabel = Titanium.UI.createLabel({
    text: '¿Reservar esta noche?',
    height: 30,
    top: 20,
    color: '#fff',
    left: 10,
    font: {
      fontSize: 20,
      fontWeight: 'bold'
    }
  });
  booksText1Label = Titanium.UI.createLabel({
    text: 'Todavía no has realizado ninguna reserva.',
    top: 60,
    height: 20,
    color: '#fff',
    left: 10,
    font: {
      fontSize: 14
    }
  });
  booksText2Label = Titanium.UI.createLabel({
    text: 'Cuando lo hayas hecho, podrás encontrar tus resguardos en esta sección para poder acceder a ellos de forma fácil cuando vayas al hotel',
    top: 100,
    height: 50,
    color: '#fff',
    left: 10,
    font: {
      fontSize: 14
    }
  });
  booksText3Label = Titanium.UI.createLabel({
    text: '¿Ya has hecho alguna reserva? \n Ve a Opciones y entra con tu usuario.',
    top: 150,
    height: 100,
    color: '#fff',
    left: 10,
    font: {
      fontSize: 14
    }
  });
  root.listBooksView.add(booksTitleLabel);
  root.listBooksView.add(booksText1Label);
  root.listBooksView.add(booksText2Label);
  root.listBooksView.add(booksText3Label);
  root.listBooksWindow.add(root.listBooksView);
  root.showBooksView = function(deal) {
    root.listBooksWindow.add(root.listBooksView);
    root.tabGroup.activeTab.open(root.listBooksWindow, {
      animated: true
    });
    return 1;
  };
}).call(this);

(function() {
  root.bookView = Titanium.UI.createView({
    backgroundImage: 'images/background1.png',
    borderWidth: 0,
    width: 320,
    top: 0
  });
  root.booksTitleLabel = Titanium.UI.createLabel({
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
  root.booksText1Label = Titanium.UI.createLabel({
    text: 'Todavía no has realizado ninguna reserva.',
    top: 60,
    height: 20,
    color: '#fff',
    left: 10,
    font: {
      fontSize: 14
    }
  });
  root.booksText2Label = Titanium.UI.createLabel({
    text: 'Cuando lo hayas hecho, podrás encontrar tus resguardos en esta sección para poder acceder a ellos de forma fácil cuando vayas al hotel',
    top: 100,
    height: 50,
    color: '#fff',
    left: 10,
    font: {
      fontSize: 14
    }
  });
  root.booksText3Label = Titanium.UI.createLabel({
    text: '¿Ya has hecho alguna reserva? \n Ve a Opciones y entra con tu usuario.',
    top: 150,
    height: 100,
    color: '#fff',
    left: 10,
    font: {
      fontSize: 14
    }
  });
  root.bookView.add(root.booksTitleLabel);
  root.bookView.add(root.booksText1Label);
  root.bookView.add(root.booksText2Label);
  root.bookView.add(root.booksText3Label);
  root.bookWindow.add(root.bookView);
  root.showBookView = function(deal) {
    root.bookWindow.add(root.bookView);
    if (Titanium.Facebook.loggedIn) {
      root.tabGroup.activeTab.open(root.bookWindow, {
        animated: true
      });
    } else {
      root.tabGroup.activeTab.open(root.accountWindow, {
        animated: true
      });
    }
    return 1;
  };
}).call(this);

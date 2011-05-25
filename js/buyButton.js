(function() {
  root.buyButton = Titanium.UI.createButton({
    backgroundImage: 'images/BUTT_gry_off.png',
    backgroundSelectedImage: 'images/BUTT_gry_on.png',
    backgroundDisabledImage: 'images/BUTT_drk_off.png',
    color: '#000',
    title: 'Reservar',
    width: 220,
    height: 40,
    font: {
      fontSize: 20,
      fontWeight: 'bold',
      fontFamily: 'Helvetica Neue'
    },
    top: 295
  });
  root.buyButton.addEventListener('click', function(e) {
    alert('Comprando');
    return root.showBookView(root.deal);
  });
}).call(this);

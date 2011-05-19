(function() {
  root.buyButton = Titanium.UI.createButton({
    backgroundImage: 'images/BUTT_grn_off.png',
    backgroundSelectedImage: 'images/BUTT_grn_on.png',
    backgroundDisabledImage: 'images/BUTT_drk_off.png',
    color: '#fff',
    title: 'Reservar',
    width: 220,
    height: 50,
    font: {
      fontSize: 20,
      fontWeight: 'bold',
      fontFamily: 'Helvetica Neue'
    },
    top: 180
  });
  root.buyButton.addEventListener('click', function(e) {
    return root.showBookView(root.deal);
  });
}).call(this);

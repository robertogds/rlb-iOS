# Botón de comprar
root.buyButton = Titanium.UI.createButton
  backgroundImage:'images/BUTT_gry_off.png'
  backgroundSelectedImage:'images/BUTT_gry_on.png'
  backgroundDisabledImage: 'images/BUTT_drk_off.png'
  color: '#000'
  title: 'Reservar'
  width:220
  height:40
  font:{fontSize:20,fontWeight:'bold',fontFamily:'Helvetica Neue'}
  top: 320

root.buyButton.addEventListener 'click', (e) ->
  root.showBookView(root.deal)


root.oneDealView = Titanium.UI.createView
  background: 'transparent'
  borderWidth: 0
  width:320
  height:480
  top: 0
  
root.oneDealImage = Titanium.UI.createImageView 
  top: 1
  width: 200
  height: 120

root.oneDealPriceLabel = Titanium.UI.createLabel
  width: 320
  height: 70
  textAlign: 'center'
  color: '#000'
  font:
    fontSize: 28
    fontWeight: 'normal'
    fontFamily:'Helvetica Neue'
  top: 120

# Botón de comprar
  root.buyButton = Titanium.UI.createButton
    backgroundImage:'rlb/images/BUTT_grn_off.png',
    backgroundSelectedImage:'rlb/images/BUTT_grn_on.png',
    backgroundDisabledImage: 'rlb/images/BUTT_drk_off.png',
    color: '#fff'
    title: 'Reservar'
    width:220
    height:50
    font:{fontSize:20,fontWeight:'bold',fontFamily:'Helvetica Neue'}
    top: 190

  root.buyButton.addEventListener 'click', (e) ->
    alert('Compra')

# Etiqueta con la descripcion
  root.descriptionLabel = Titanium.UI.createLabel
    backgroundColor: '#e5e5e5'
    width: 300
    height: 40
    borderRadius: 10
    borderWidth: 2
    borderColor: '#cccccc'
    textAlign: 'center'
    color: '#000'
    font:
      fontSize: 10
      fontWeight: 'normal'
    top: 250


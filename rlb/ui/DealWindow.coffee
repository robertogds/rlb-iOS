root.dealWindow = Ti.UI.createWindow({title:'Detalle Oferta',backgroundColor:'#fff'})

label = Titanium.UI.createLabel
	color: '#999'
	text: 'Detalle de la Oferta'
	font:
    fontSize: 20,
    fontFamily: 'Helvetica Neue'
	textAlign: 'center'
	width: 'auto'

root.dealWindow.add label


root.cargarDeal = (deal) -> 
  root.dealWindow.title = deal.hotelName
  # Window components
  image = Titanium.UI.createImageView 
    image: deal.image1
    top: 1
    width: 400
    height: 150
  root.dealWindow.add(image)
  root.dealWindow
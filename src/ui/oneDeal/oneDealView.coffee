Ti.include(
  '/js/oneDealButtonBar.js'
  '/js/oneDealMapView.js'
  '/js/imagesScrollView.js'
  '/js/infoDealTable.js'
  '/js/buyButton.js'
)

root.oneDealView = Titanium.UI.createView
  background: 'transparent'
  borderWidth: 0
  width:320
  top: 40
  
root.oneDealImage = Titanium.UI.createImageView 
  top: 0
  width: 320
  height: 120

root.oneDealImage.addEventListener 'click', (e) ->
  root.imagesWindow.add(root.imagesScrollView)
  root.tabGroup.activeTab.open(root.imagesWindow,{animated:true})

separator1 = new root.GenericSeparatorView(120).view
root.oneDealView.add(separator1)

separator2 = new root.GenericSeparatorView(200).view
root.oneDealView.add(separator2)

priceView = Titanium.UI.createView
  backgroundColor: 'black'
  borderWidth: 0
  width:320
  top: 122
  height: 77


root.oneDealPriceLabel = Titanium.UI.createLabel
  width: 85
  textAlign: 'left'
  color: '#fff'
  font:
    fontSize: 36
    fontWeight: 'bold'
    fontFamily:'Helvetica Neue'
  top: 0
  left: 15

priceView.add(root.oneDealPriceLabel)


sepVertView = Titanium.UI.createView
  backgroundColor: '#444547' 
  left: 105
  top: 26
  height: 28
  width: 1

priceView.add(sepVertView)

antesLabel = Titanium.UI.createLabel
  text: 'antes'
  color: '#868d92'
  left: 110
  font:
    fontSize: 16
  width: 40
  height: 20
  top: 18
priceView.add(antesLabel)

root.oneDealNormalPriceLabel = Titanium.UI.createLabel
  width: 77
  height: 30
  textAlign: 'left'
  color: '#868d92'
  font:
    fontSize: 20
    fontWeight: 'bold'
    fontFamily:'Helvetica Neue'
  top: 33
  left: 110
priceView.add(root.oneDealNormalPriceLabel)

bookingLabel = Titanium.UI.createLabel
  backgroundImage: '/images/booking_background.png'
  width: 108
  height: 33
  borderRadius: 5
  backgroundColor: '#0098cb'
  text: ' reservar'
  font:
    fontSize: 18
    fontWeight: 'bold'
    fontFamily:'Helvetica Neue'
  top: 24
  left: 200

bookingLabel.addEventListener 'click', (e) ->
  root.showBookingView() 

priceView.add(bookingLabel) 

addressView = Titanium.UI.createView
  backgroundColor: 'transparent'
  borderWidth: 0
  borderColor: 'red'
  width:320
  top: 200
  height: 50

addressView.addEventListener 'click', (e) ->
  root.oneDealWindow.remove root.oneDealView
  root.oneDealWindow.remove root.infoDealTable
  root.oneDealWindow.add root.mapView

poiImage = Titanium.UI.createImageView 
  #top: 210
  image: '/images/poi.png'
  width: 15
  height: 20
  left: 5
#root.oneDealView.add(poiImage)
addressView.add(poiImage)

root.oneDealAddressLabel = Titanium.UI.createLabel
  width: 280
  height: 40
  textAlign: 'left'
  color: '#fff'
  font:
    fontSize: 14
    fontWeight: 'normal'
    fontFamily:'Helvetica Neue'
    fontWeight: 'bold'
  #top: 205
  left: 25

addressView.add(root.oneDealAddressLabel)

separator3 = new root.GenericSeparatorView(250).view
root.oneDealView.add(separator3)

infoImage = Titanium.UI.createImageView 
  top: 260
  image: '/images/icon_info.png'
  width: 20
  height: 20
  left: 5
root.oneDealView.add(infoImage)

root.descriptionLabel = Titanium.UI.createLabel
  width: 280
  height: 60
  textAlign: 'left'
  color: '#fff'
  font:
    fontSize: 14
    fontWeight: 'normal'
    fontFamily:'Helvetica Neue'
    #fontWeight: 'bold'
  top: 260
  left: 25
root.descriptionLabel.addEventListener 'click', (e) ->
  root.oneDealWindow.remove root.oneDealView 
  root.oneDealWindow.remove root.mapView
  root.oneDealWindow.add root.infoDealTable

root.oneDealView.add(root.oneDealImage)
root.oneDealView.add(priceView)
root.oneDealView.add(addressView)
#root.oneDealView.add(root.oneDealAddressLabel)
root.oneDealView.add(root.descriptionLabel) 
root.oneDealWindow.add(root.oneDealButtonBarView)
root.oneDealWindow.add(root.oneDealView)

root.showDealView = (deal) -> 
  root.deal = deal
  # Map
  root.mapView.removeAllAnnotations()
  root.hotelAnnotation.latitude = deal.latitude
  root.hotelAnnotation.longitude = deal.longitude
  root.hotelAnnotation.title = deal.hotelName
  root.hotelAnnotation.subtitle = deal.address
  region =
    latitude: deal.latitude
    longitude: deal.longitude
    latitudeDelta: 0.01
    longitudeDelta: 0.01
  root.mapView.region = region
  root.mapView.setLocation region
  root.mapView.addAnnotation root.hotelAnnotation
  
  # one deal window
  root.oneDealWindow.title = deal.hotelName
  root.oneDealImage.image = deal.mainImageBig 
  root.oneDealPriceLabel.text = deal.salePriceCents + "€"
  root.oneDealNormalPriceLabel.text = deal.priceCents + "€"
  root.oneDealAddressLabel.text = deal.address + '\n' + deal.city.name
  root.descriptionLabel.text = deal.hotelText

  # Load Images of the deal
  root.image1.image = deal.image1
  root.image2.image = deal.image2
  root.image3.image = deal.image3
  root.image4.image = deal.image4
  root.image5.image = deal.image5
  
  # infoTable view

  # Titles
  detailTitle = "Los Detalles"
  hotelTitle = 'El Hotel'
  roomTitle = 'La Habitación'
  foodDrinkTitle = 'Comer y Beber'
  aroundTitle = 'Alrededores'

  # Rows
  detailRow = new root.GenericTextRow().row
  hotelRow = new root.GenericTextRow().row
  roomRow = new root.GenericTextRow().row
  foodDrinkRow = new root.GenericTextRow().row
  aroundRow = new root.GenericTextRow().row

  # Views
  detailView =  new root.GenericTextView(0,detailTitle,deal.detailText).view
  hotelView = new root.GenericTextView(0,hotelTitle,deal.hotelText).view
  roomView =  new root.GenericTextView(0,roomTitle,deal.roomText).view
  foodDrinkView = new root.GenericTextView(0,foodDrinkTitle,deal.foodDrinkText).view
  aroundView = new root.GenericTextView(0,aroundTitle,deal.aroundText).view

  detailRow.add(detailView)
  hotelRow.add(hotelView)
  roomRow.add(roomView)
  foodDrinkRow.add(foodDrinkView)
  aroundRow.add(aroundView)

  data = []
  data.push(detailRow)
  data.push(hotelRow)
  data.push(roomRow)
  data.push(foodDrinkRow)
  data.push(aroundRow)
  root.infoDealTable.setData(data)
  root.oneDealWindow.remove root.infoDealTable
  root.oneDealWindow.remove root.mapView
  root.oneDealWindow.add root.oneDealView



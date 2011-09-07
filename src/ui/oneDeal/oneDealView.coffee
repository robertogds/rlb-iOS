Ti.include(
  '/js/oneDealMapView.js'
  '/js/imagesScrollView.js'
  '/js/infoDealTable.js'
  '/js/priceView.js'
)
if (Titanium.Platform.name == 'android') 
  Ti.include('/js/androidOneDealButtonBar.js')
else
  Ti.include('/js/oneDealButtonBar.js')

root.oneDealView = Titanium.UI.createView
  backgroundColor:'#0d1e28'
  width: Ti.Platform.displayCaps.platformWidth
  top: 40
  
root.oneDealImage = Titanium.UI.createImageView 
  top: 0
  width: Ti.Platform.displayCaps.platformWidth
  height: 120

root.oneDealView.add(root.oneDealImage)

if (Titanium.Platform.name isnt 'android') 
  root.oneDealImage.addEventListener 'click', (e) ->
    root.imagesWindow.add(root.imagesScrollView)
    root.tabGroup.activeTab.open(root.imagesWindow,{animated:true})

addressView = Titanium.UI.createView
  backgroundColor:'#0d1e28'
  top: 197
  height: 40

descriptionView = Titanium.UI.createView
  width: '100%'
  backgroundColor:'#0d1e28'
  top: 247
  height: 85


root.oneDealAddressLabel = Titanium.UI.createLabel
  top: 0
  height: '100%'
  textAlign: 'left'
  color: '#fff'
  font:
    fontSize: 14
    fontWeight: 'normal'
    fontFamily:'Helvetica Neue'
    fontWeight: 'bold'
  left: 20

addressView.add(root.oneDealAddressLabel)

root.descriptionLabel = Titanium.UI.createLabel
  #width: '90%'
  height: '100%'
  textAlign: 'left'
  color: '#fff'
  font:
    fontSize: 14
    fontWeight: 'normal'
    fontFamily:'Helvetica Neue'
    #fontWeight: 'bold'
  top: 6
  left: 20
  right: 5

root.oneDealView.add(root.priceView)
root.oneDealView.add(addressView)

descriptionView.add(root.descriptionLabel)
root.oneDealView.add(descriptionView) 

root.oneDealWindow.add(root.oneDealButtonBarView)
root.oneDealWindow.add(root.oneDealView)

separator1 = new root.GenericSeparatorView(198).view
root.oneDealView.add(separator1)

separator2 = new root.GenericSeparatorView(237).view
root.oneDealView.add(separator2)

root.showDealView = (deal) -> 
  root.deal = deal
  Ti.API.info(deal)
  if deal.quantity is 0 
    root.priceView.remove(root.bookingLabel)
    root.priceView.add(root.soldOutLabel)
    root.soldOutLabel.show()
    root.bookingLabel.hide()
  else
    root.priceView.add(root.bookingLabel)
    root.priceView.remove(root.soldOutLabel)
    root.soldOutLabel.hide()
    root.bookingLabel.show()
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
  root.oneDealAddressLabel.text = deal.address 
  root.descriptionLabel.text = deal.detailText

  # Load Images of the deal
  root.image1.image = deal.image1
  root.image2.image = deal.image2
  root.image3.image = deal.image3
  root.image4.image = deal.image4
  root.image5.image = deal.image5
  Ti.API.info(deal.image1)
  Ti.API.info(deal.image2)
  Ti.API.info(deal.image3)
  Ti.API.info(deal.image4)
  Ti.API.info(deal.image5)
  
  # infoTable view

  # Titles
  detailTitle = L('detailTitle')
  hotelTitle = L('hotelTitle')
  roomTitle = L('roomTitle')
  foodDrinkTitle = L('foodDrinkTitle')
  aroundTitle = L('around')

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

  infoData = []
  infoData.push(detailRow)
  infoData.push(hotelRow)
  infoData.push(roomRow)
  infoData.push(foodDrinkRow)
  infoData.push(aroundRow)
  root.infoDealTable.setData(infoData)
  root.oneDealWindow.remove root.infoDealTable
  root.oneDealWindow.remove root.mapView
  root.oneDealWindow.add root.oneDealView

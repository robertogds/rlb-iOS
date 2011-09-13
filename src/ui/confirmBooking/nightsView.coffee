root.nightsView = Titanium.UI.createView
  backgroundColor:'#0d1e28'
  width: Ti.Platform.displayCaps.platformWidth

nightsTitleLabel = Titanium.UI.createLabel
  top: 5
  height: 20
  text: L('addNights')
  left: 8
  color: '#fff'
  font:
    fontSize: 16
    fontWeight: 'bold'

root.nightsView.add(nightsTitleLabel)

checkinTitleLabel = Titanium.UI.createLabel
  text: L('checkin')
  color: '#fff'
  font:
    fontSize: 14
    fontWeight: 'bold'
  left: 10
  height: 20
  top: 40

checkoutTitleLabel = Titanium.UI.createLabel
  text: L('checkout') 
  color: '#fff'
  font:
    fontSize: 14
    fontWeight: 'bold'
  left: 10
  height: 20
  top: 62

nightsCheckinLabel = Titanium.UI.createLabel
  color: '#868d92'
  font:
    fontSize: 14
  left: 90
  top: 40
  height: 20

nightsCheckoutLabel = Titanium.UI.createLabel
  color: '#868d92'
  font:
    fontSize: 14
  left: 90
  top: 62
  height: 20

night1View = Titanium.UI.createView
  borderWidth:2
  id:1
  borderColor: 'black'
  left: 20
  height: 100
  width: 90
  top: 100
  backgroundGradient:
    type:'linear'
    colors:[{color:'#0098cb',position:0.1},{color:'#017096',position:1.0}]
 
night1View.addEventListener 'click', (e) ->
  root.checkoutDate = new Date(root.checkinDate.getTime() + 86400000)
  root.bookingNights = 1
  root.totalPrice = root.deal.salePriceCents
  pullButton(night2View)
  pullButton(night3View)
  pullButton(night4View)
  pullButton(night5View)

night1DayofweekLabel = 	Titanium.UI.createLabel
  textAlign: 'center'
  color: '#fff'
  font:
    fontSize: 14
    fontWeight: 'bold'
  top: 10
  height: 20

night1DateLabel = Titanium.UI.createLabel
  textAlign: 'center'
  color: '#fff'
  font:
    fontSize: 14
  top: 30
  height: 20
	
night1PriceLabel = 	Titanium.UI.createLabel
  textAlign: 'center'
  color: '#fff'
  font:
    fontSize: 20
    fontWeight: 'bold'
  top: 60
  height: 20

night1View.add(night1DayofweekLabel)
night1View.add(night1DateLabel)
night1View.add(night1PriceLabel)

night2View = Titanium.UI.createView
  id:2
  visible: false
  borderWidth:1
  borderColor: 'black'
  left: 110
  height: 100
  width: 90
  top: 100
  backgroundGradient:
    type:'linear'
    colors:[{color:'#ededed',position:0.1},{color:'#c2c1c1',position:1.0}]
	
night2View.addEventListener 'click', (e) ->
  pushButton(night2View)
  pullButton(night3View)
  pullButton(night4View)
  pullButton(night5View)
  

night2DayofweekLabel = Titanium.UI.createLabel
  textAlign: 'center'
  color: '#000'
  text: "Monday"
  font:
    fontSize: 14
    fontWeight: 'bold'
  top: 10
  height: 20

night2DateLabel = Titanium.UI.createLabel
  textAlign: 'center'
  color: '#000'
  text: "AUG 29"
  font:
    fontSize: 14
  top: 30
  height: 20

night2PriceLabel = Titanium.UI.createLabel
  textAlign: 'center'
  color: '#000'
  text: "89€"
  font:
    fontSize: 20
    fontWeight: 'bold'
  top: 60
  height: 20

night2View.add(night2DayofweekLabel)
night2View.add(night2DateLabel)
night2View.add(night2PriceLabel)
	
night3View = Titanium.UI.createView
  id:3
  visible: false
  borderWidth:1
  borderColor: 'black'
  left: 200
  height: 100
  width: 90
  top: 100
  backgroundGradient:
    type:'linear'
    colors:[{color:'#ededed',position:0.1},{color:'#c2c1c1',position:1.0}]

night3View.addEventListener 'click', (e) ->
  pushButton(night2View)
  pushButton(night3View)
  pullButton(night4View)
  pullButton(night5View)

night3DayofweekLabel = Titanium.UI.createLabel
  textAlign: 'center'
  color: '#000'
  text: "Monday"
  font:
    fontSize: 14
    fontWeight: 'bold'
  top: 10
  height: 20

night3DateLabel = Titanium.UI.createLabel
  textAlign: 'center'
  color: '#000'
  text: "AUG 29"
  font:
    fontSize: 14
  top: 30
  height: 20

night3PriceLabel = Titanium.UI.createLabel
  textAlign: 'center'
  color: '#000'
  text: "89€"
  font:
    fontSize: 20
    fontWeight: 'bold'
  top: 60
  height: 20

night3View.add(night3DayofweekLabel)
night3View.add(night3DateLabel)
night3View.add(night3PriceLabel)

night4View = Titanium.UI.createView
  visible: false
  id:4
  borderWidth:1
  borderColor: 'black'
  left: 20
  height: 100
  width: 90
  top: 200
  backgroundGradient:
    type:'linear'
    colors:[{color:'#ededed',position:0.1},{color:'#c2c1c1',position:1.0}]
	
night4View.addEventListener 'click', (e) ->
  pushButton(night2View)
  pushButton(night3View)
  pushButton(night4View)
  pullButton(night5View)

night4DayofweekLabel = Titanium.UI.createLabel
  textAlign: 'center'
  color: '#000'
  text: "Monday"
  font:
    fontSize: 14
    fontWeight: 'bold'
  top: 10
  height: 20

night4DateLabel = Titanium.UI.createLabel
  textAlign: 'center'
  color: '#000'
  text: "AUG 29"
  font:
    fontSize: 14
  top: 30
  height: 20

night4PriceLabel = Titanium.UI.createLabel
  textAlign: 'center'
  color: '#000'
  text: "89€"
  font:
    fontSize: 20
    fontWeight: 'bold'
  top: 60
  height: 20

night4View.add(night4DayofweekLabel)
night4View.add(night4DateLabel)
night4View.add(night4PriceLabel)
 
night5View = Titanium.UI.createView
  id:5
  visible: false
  borderWidth:1
  borderColor: 'black'
  left: 110
  height: 100
  width: 90
  top: 200
  backgroundGradient:
    type:'linear'
    colors:[{color:'#ededed',position:0.1},{color:'#c2c1c1',position:1.0}]

night5View.addEventListener 'click', (e) ->
  pushButton(night2View)
  pushButton(night3View)
  pushButton(night4View)
  pushButton(night5View)

night5DayofweekLabel = Titanium.UI.createLabel
  textAlign: 'center'
  color: '#000'
  text: "Monday"
  font:
    fontSize: 14
    fontWeight: 'bold'
  top: 10
  height: 20

night5DateLabel = Titanium.UI.createLabel
  textAlign: 'center'
  color: '#000'
  text: "AUG 29"
  font:
    fontSize: 14
  top: 30
  height: 20

night5PriceLabel = Titanium.UI.createLabel
  textAlign: 'center'
  color: '#000'
  text: "89€"
  font:
    fontSize: 20
    fontWeight: 'bold'
  top: 60
  height: 20

night5View.add(night5DayofweekLabel)
night5View.add(night5DateLabel)
night5View.add(night5PriceLabel)

root.nightsView.add(night1View)
root.nightsView.add(night2View)
root.nightsView.add(night3View)
root.nightsView.add(night4View)
root.nightsView.add(night5View)


root.nightsView.add(nightsCheckoutLabel)
root.nightsView.add(nightsCheckinLabel)
root.nightsView.add(checkinTitleLabel)
root.nightsView.add(checkoutTitleLabel)
root.nightsWindow.add(root.nightsView)

confirmButton = new root.GenericButton(310,L('save')).button 
confirmButton.addEventListener 'click', (e) ->
  root.nightsWindow.close
root.nightsView.add(confirmButton)

pushButton = (view)->
  view.borderWidth = 2
  view.backgroundGradient = 
    type:'linear'
    colors:[{color:'#0098cb',position:0.1},{color:'#017096',position:1.0}]
  root.checkoutDate = new Date(root.checkinDate.getTime() + (86400000 * view.id))
  root.bookingNights = view.id
  switch view.id 
    when 2
      night2DayofweekLabel.color = '#fff'
      night2DateLabel.color = '#fff'
      night2PriceLabel.color = '#fff'
      root.totalPrice = root.deal.salePriceCents + root.deal.priceDay2
    when 3
      night3DayofweekLabel.color = '#fff'
      night3DateLabel.color = '#fff'
      night3PriceLabel.color = '#fff'
      root.totalPrice = root.deal.salePriceCents + root.deal.priceDay2 + root.deal.priceDay3
    when 4
      night4DayofweekLabel.color = '#fff'
      night4DateLabel.color = '#fff'
      night4PriceLabel.color = '#fff'
      root.totalPrice = root.deal.salePriceCents + root.deal.priceDay2 + root.deal.priceDay3 + root.deal.priceDay4
    when 5
      night5DayofweekLabel.color = '#fff'
      night5DateLabel.color = '#fff'
      night5PriceLabel.color = '#fff'
      root.totalPrice = root.deal.salePriceCents + root.deal.priceDay2 + root.deal.priceDay3 + root.deal.priceDay4 + root.deal.priceDay5
  nightsCheckoutLabel.text = root.getLocaleDateString(root.checkoutDate)

pullButton = (view)->
  view.borderWidth = 1
  view.backgroundGradient = 
    type:'linear'
    colors:[{color:'#ededed',position:0.1},{color:'#c2c1c1',position:1.0}]
  switch view.id 
    when 2 
      night2DayofweekLabel.color = '#000'
      night2DateLabel.color = '#000'
      night2PriceLabel.color = '#000' 
    when 3 
      night3DayofweekLabel.color = '#000'
      night3DateLabel.color = '#000'
      night3PriceLabel.color = '#000'
    when 4 
      night4DayofweekLabel.color = '#000'
      night4DateLabel.color = '#000'
      night4PriceLabel.color = '#000' 
    when 5 
      night5DayofweekLabel.color = '#000'
      night5DateLabel.color = '#000'
      night5PriceLabel.color = '#000'
  nightsCheckoutLabel.text = root.getLocaleDateString(root.checkoutDate)

root.loadNightsView = ()->
  nightsCheckinLabel.text = root.getLocaleDateString(root.checkinDate)
  nightsCheckoutLabel.text = root.getLocaleDateString(root.checkoutDate)
  night1DayofweekLabel.text = root.getDayOfWeekString(root.checkinDate)
  night1DateLabel.text = root.getShortMonthString(root.checkinDate) + ' ' + root.checkinDate.getDate()
  if root.deal.priceDay2 > 0
    day2 = new Date(root.checkinDate.getTime() + 86400000 )
    night2DayofweekLabel.text = root.getDayOfWeekString(day2)
    night2DateLabel.text = root.getShortMonthString(day2) + ' ' + day2.getDate()
    night2PriceLabel.text = root.deal.priceDay2 + '€'
    night2View.visible = true
  else night2View.visible = false

  if root.deal.priceDay3 > 0
    day3 = new Date(root.checkinDate.getTime() + 86400000 * 2)
    night3DayofweekLabel.text = root.getDayOfWeekString(day3)
    night3DateLabel.text = root.getShortMonthString(day3) + ' ' + day3.getDate()
    night3PriceLabel.text = root.deal.priceDay3 + '€'
    night3View.visible = true
  else night3View.visible = false
    
  if root.deal.priceDay4 > 0
    day4 = new Date(root.checkinDate.getTime() + 86400000 * 3)
    night4DayofweekLabel.text = root.getDayOfWeekString(day4)
    night4DateLabel.text = root.getShortMonthString(day4) + ' ' + day4.getDate()
    night4PriceLabel.text = root.deal.priceDay4 + '€'
    night4View.visible = true
  else night4View.visible = false

  if root.deal.priceDay5 > 0
    day5 = new Date(root.checkinDate.getTime() + 86400000 * 4)
    night5DayofweekLabel.text = root.getDayOfWeekString(day5)
    night5DateLabel.text = root.getShortMonthString(day5) + ' ' + day5.getDate()
    night5PriceLabel.text = root.deal.priceDay5 + '€'
    night5View.visible = true
  else night5View.visible = false
  
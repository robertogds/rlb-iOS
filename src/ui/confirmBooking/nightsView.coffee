root.nightsView = Titanium.UI.createView
  backgroundColor:'#0d1e28'
  width: Ti.Platform.displayCaps.platformWidth

nightsTitleLabel = Titanium.UI.createLabel
  top: 5
  height: 20
  text: "Add extra nights to your stay"
  left: 8
  color: '#fff'
  font:
    fontSize: 16
    fontWeight: 'bold'

root.nightsView.add(nightsTitleLabel)

checkinTitleLabel = Titanium.UI.createLabel
  text: "Check-in:" 
  color: '#fff'
  font:
    fontSize: 14
    fontWeight: 'bold'
  left: 10
  height: 20
  top: 30

checkoutTitleLabel = Titanium.UI.createLabel
  text: "Check-out:" 
  color: '#fff'
  font:
    fontSize: 14
    fontWeight: 'bold'
  left: 10
  height: 20
  top: 52

nightsCheckinLabel = Titanium.UI.createLabel
  color: '#868d92'
  text: "hola"
  font:
    fontSize: 14
  left: 90
  top: 30
  height: 20

nightsCheckoutLabel = Titanium.UI.createLabel
  color: '#868d92'
  text: "hola2"
  font:
    fontSize: 14
  left: 90
  top: 52
  height: 20

night1View = Titanium.UI.createView
  borderWidth:3
  borderColor: 'black'
  left: 20
  height: 100
  width: 90
  top: 100
  backgroundGradient:
    type:'linear'
    colors:[{color:'#0098cb',position:0.1},{color:'#017096',position:1.0}]

night1DayofweekLabel = 	Titanium.UI.createLabel
  textAlign: 'center'
  color: '#fff'
  text: "Sunday"
  font:
    fontSize: 14
    fontWeight: 'bold'
  top: 10
  height: 20

night1DateLabel = Titanium.UI.createLabel
  textAlign: 'center'
  color: '#fff'
  text: "AUG 28"
  font:
    fontSize: 14
  top: 30
  height: 20
	
night1PriceLabel = 	Titanium.UI.createLabel
  textAlign: 'center'
  color: '#fff'
  text: "79€"
  font:
    fontSize: 20
    fontWeight: 'bold'
  top: 60
  height: 20

night1View.add(night1DayofweekLabel)
night1View.add(night1DateLabel)
night1View.add(night1PriceLabel)

night2View = Titanium.UI.createView
  borderWidth:1
  borderColor: 'black'
  left: 110
  height: 100
  width: 90
  top: 100
  backgroundGradient:
    type:'linear'
    colors:[{color:'#ededed',position:0.1},{color:'#c2c1c1',position:1.0}]
	
root.bookingLabel.addEventListener 'click', (e) ->
  root.showBookingView()

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
  borderWidth:1
  borderColor: 'black'
  left: 200
  height: 100
  width: 90
  top: 100
  backgroundGradient:
    type:'linear'
    colors:[{color:'#ededed',position:0.1},{color:'#c2c1c1',position:1.0}]

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
  borderWidth:1
  borderColor: 'black'
  left: 20
  height: 100
  width: 90
  top: 200
  backgroundGradient:
    type:'linear'
    colors:[{color:'#ededed',position:0.1},{color:'#c2c1c1',position:1.0}]

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
  borderWidth:1
  borderColor: 'black'
  left: 110
  height: 100
  width: 90
  top: 200
  backgroundGradient:
    type:'linear'
    colors:[{color:'#ededed',position:0.1},{color:'#c2c1c1',position:1.0}]

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

confirmButton = new root.GenericButton(310,L('confirm')).button 
root.nightsView.add(confirmButton)

root.loadNightsView = ()->
  checkoutDate = new Date(root.checkinDate.getTime() + 86400000)
  nightsCheckinLabel.text = root.checkinDate.toLocaleDateString()
  nightsCheckoutLabel.text = checkoutDate.toLocaleDateString()
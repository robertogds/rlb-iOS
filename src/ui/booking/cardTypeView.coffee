root.cardTypeView = Titanium.UI.createView
  background: 'transparent'
  borderWidth: 0
  width:320
  top: 100

pickerView = Titanium.UI.createView
  background: 'transparent'
  top:150

buttonView = Titanium.UI.createView
  backgroundColor: '#75757f'
  opacity: 0.9
  top:0

root.cardTypePicker = Titanium.UI.createPicker()

root.cardTypePicker.addEventListener 'change', (e) ->
  Ti.API.info("You selected row: "+e.row+", column: "+e.column+", custom_item: "+e.row.custom_item)
  #root.expiresLabel.text = "row index: "+e.rowIndex+", column index: "+e.columnIndex
  if e.row.month_item
    root.cardExpiresMonth = e.row.month_item
  else if e.row.year_item
    root.cardExpiresYear = e.row.year_item
  1

infoLabel = Titanium.UI.createLabel
  width: 320
  height: 60
  textAlign: 'center'
  text: 'Selecciona el tipo de tarjeta'
  color: '#fff'
  font:
    fontSize: 14
    fontWeight: 'normal'
    fontFamily:'Helvetica Neue'
  top: 0

root.expiresButton = Titanium.UI.createButton
  backgroundImage:'images/BUTT_gry_off.png'
  backgroundSelectedImage:'images/BUTT_gry_on.png'
  backgroundDisabledImage: 'images/BUTT_drk_off.png'
  borderWidth: 0
  color: '#000'
  title: 'Hecho'
  width:220
  height:40
  font:{fontSize:20,fontWeight:'bold',fontFamily:'Helvetica Neue'}
  top: 50

root.cardTypeButton.addEventListener 'click', (e) ->
  root.cardTypeView.hide()
  root.cardTypeLabel.text = 'a'
  1

pickerView.add(root.expiresPicker)
buttonView.add(infoLabel)
buttonView.add(root.expiresButton)
root.cardTypeView.add(buttonView)
root.cardTypeView.add(pickerView)
root.cardTypeView.hide()

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


data = []
data[0]=Ti.UI.createPickerRow({title:'Visa',custom_item:'Visa'})
data[1]=Ti.UI.createPickerRow({title:'Mastercard',custom_item:'Mastercard'})
data[2]=Ti.UI.createPickerRow({title:'American Express',custom_item:'American Express'})

root.cardTypePicker.selectionIndicator = true
root.cardTypePicker.add(data)


root.cardTypePicker.addEventListener 'change', (e) ->
  root.cardType = e.row.custom_item
  root.cardTypeLabel.text = e.row.custom_item
  1

infoLabel = Titanium.UI.createLabel
  width: 320
  height: 60
  textAlign: 'center'
  text: Ti.Locale.getString('selectCardType')
  color: '#fff'
  font:
    fontSize: 14
    fontWeight: 'normal'
    fontFamily:'Helvetica Neue'
  top: 0

cardTypeButton = new root.GenericButton(50,Ti.Locale.getString('done')).button

cardTypeButton.addEventListener 'click', (e) ->
  root.cardTypeLabel.text = root.cardType
  root.cardTypeView.hide()
  root.cardNumberText.focus()

pickerView.add(root.cardTypePicker)
buttonView.add(infoLabel)
buttonView.add(cardTypeButton)
root.cardTypeView.add(buttonView)
root.cardTypeView.add(pickerView)
root.cardTypeView.hide()

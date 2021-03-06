Ti.include(
  '/js/expiresPicker.js'
)
root.expiresView = Titanium.UI.createView
  background: 'transparent'
  borderWidth: 0
  top: 100

pickerView = Titanium.UI.createView
  background: 'transparent'
  top:150

pickerView.add(root.expiresPicker)

infoLabel = Titanium.UI.createLabel
  height: 60
  textAlign: 'center'
  text: L('expires')
  color: '#fff'
  font:
    fontSize: 14
    fontWeight: 'normal'
    fontFamily:'Helvetica Neue'
  top: 0


buttonView = Titanium.UI.createView
  backgroundColor: '#75757f'
  opacity: 0.9
  top:0

expiresButton = new root.GenericButton(50,L('done')).button

buttonView.add(infoLabel)
buttonView.add(expiresButton)

expiresButton.addEventListener 'click', (e) ->
  root.expiresLabel.text = root.cardExpiresMonth + '/' + root.cardExpiresYear
  root.expiresView.hide()
  root.cvcCodeText.focus()

root.expiresView.add(buttonView)
root.expiresView.add(pickerView)
root.expiresView.hide()


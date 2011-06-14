root.confirmButton = Titanium.UI.createButton
  backgroundImage:'images/BUTT_gry_off.png'
  backgroundSelectedImage:'images/BUTT_gry_on.png'
  backgroundDisabledImage: 'images/BUTT_drk_off.png'
  borderWidth: 1
  color: '#000'
  title: 'Confirmar'
  width:220
  height:40
  font:{fontSize:20,fontWeight:'bold',fontFamily:'Helvetica Neue'}
  top: 280

root.confirmButton.addEventListener 'click', (e) ->
  root.doBooking()
  1
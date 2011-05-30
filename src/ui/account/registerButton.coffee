# Botón de comprar
root.registerButton = Titanium.UI.createButton
  backgroundImage:'images/BUTT_gry_off.png'
  backgroundSelectedImage:'images/BUTT_gry_on.png'
  backgroundDisabledImage: 'images/BUTT_drk_off.png'
  color: '#000'
  title: 'Crear una cuenta'
  width:220
  height:40
  font:{fontSize:20,fontWeight:'bold',fontFamily:'Helvetica Neue'}
  top: 200

root.registerButton.addEventListener 'click', (e) ->
  root.tabGroup.activeTab.open(root.newAccountWindow,{animated:true})

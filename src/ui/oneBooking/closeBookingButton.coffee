root.closeBookingButton = Titanium.UI.createButton
  backgroundImage:'images/BUTT_gry_off.png'
  backgroundSelectedImage:'images/BUTT_gry_on.png'
  backgroundDisabledImage: 'images/BUTT_drk_off.png'
  borderWidth: 1
  color: '#000'
  title: 'Cerrar'
  width:220
  height:40
  font:{fontSize:20,fontWeight:'bold',fontFamily:'Helvetica Neue'}
  top: 280

root.closeBookingButton.addEventListener 'click', (e) ->
  root.confirmBookingWindow.close()
  root.oneDealWindow.close()
  #root.listDealsWindow.close()
  root.oneBookingWindow.close() 
  root.tabGroup.setActiveTab(1);
  1
root.logoutButton = Titanium.UI.createButton
  backgroundImage:'images/BUTT_gry_off.png'
  backgroundSelectedImage:'images/BUTT_gry_on.png'
  backgroundDisabledImage: 'images/BUTT_drk_off.png'
  color: '#000'
  title: 'Logout'
  width:220
  height:40
  font:{fontSize:20,fontWeight:'bold',fontFamily:'Helvetica Neue'}
  top: 200

root.logoutButton.addEventListener 'click', (e) ->
  root.userEmail = null 
  Titanium.App.Properties.setString("userEmail",root.userEmail);
  root.loginView.show()
  root.loggedView.hide()
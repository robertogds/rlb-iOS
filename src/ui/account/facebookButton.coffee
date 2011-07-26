Titanium.Facebook.appid = "210123832352906"
Titanium.Facebook.permissions = ['publish_stream', 'read_stream']

Titanium.Facebook.addEventListener 'login', (e) ->
  if e.success
    alert 'Entra con facebook'
    root.loginView.hide()
    root.loggedFacebookView.show()
  else alert 'Error' 

Titanium.Facebook.addEventListener 'logout', (e) ->
  alert('Logged out')

# add the button.  Note that it doesn't need a click event or anything.
root.facebookButton = Titanium.Facebook.createLoginButton 
  top: 150
  right: 30
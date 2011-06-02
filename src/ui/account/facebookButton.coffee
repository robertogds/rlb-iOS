Titanium.Facebook.appid = "210123832352906"
Titanium.Facebook.permissions = ['publish_stream', 'read_stream']

Titanium.Facebook.addEventListener 'click', (e) ->
  alert('Logged in') if e.success 

Titanium.Facebook.addEventListener 'logout', (e) ->
  alert('Logged out')

# add the button.  Note that it doesn't need a click event or anything.
root.facebookButton = Titanium.Facebook.createLoginButton 
  top: 20 
  style: 'wide'
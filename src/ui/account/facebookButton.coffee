Ti.include( 
  '/js/newFacebookAccount.js'
)
Titanium.Facebook.appid = "210123832352906"
Titanium.Facebook.permissions = ['publish_stream', 'read_stream', 'email']

Titanium.Facebook.addEventListener 'login', (e) ->
  if e.success   
    Titanium.Facebook.requestWithGraphPath 'me', {}, 'GET', (e) ->
      if e.success 
        root.facebookUser = JSON.parse(e.result)
        root.doFacebookRegister(root.facebookUser.email,root.facebookUser.first_name,root.facebookUser.last_name)
        root.loginView.hide()
        root.loadLoggedFacebookUser() 
        root.loggedView.show()
      else if (e.error) 
        alert(e.error)
      else 
        alert('Unknown response')
  else alert 'Error' 

Titanium.Facebook.addEventListener 'logout', (e) ->
  root.facebookUser = null
  Titanium.App.Properties.removeProperty("facebookUser")
  root.loginView.show()
  root.loggedView.hide()

# add the button.  Note that it doesn't need a click event or anything.
root.facebookButton = Titanium.Facebook.createLoginButton 
  top: 230
  right: 30
  style: 'wide'
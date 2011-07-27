root.xhrFacebookRegister = Titanium.Network.createHTTPClient()

root.xhrFacebookRegister.onload = (e) ->
  response = JSON.parse(this.responseText)
  if response.status is 200
    root.user = response.content
    root.facebookUser.rlbId = root.user.id
    root.facebookUser.rlbToken = root.user.token
    root.facebookUser.rlbSecret = root.user.secret
    Ti.API.info response.content
  else
    Ti.API.error response.detail
    root.getFBUserId()
  Titanium.App.Properties.setString("facebookUser",JSON.stringify(root.facebookUser))


root.doFacebookRegister = (email,firstName,lastName) ->
  password = Titanium.Utils.md5HexDigest("facebookUser")
  url = root.url + "/users"
  proto = 'POST'  
  root.xhrFacebookRegister.open(proto,url)
  root.xhrFacebookRegister.setRequestHeader("Content-Type","application/json; charset=utf-8")
  root.xhrFacebookRegister.setRequestHeader("Accept-Language",Titanium.Locale.currentLanguage)
  newUser = JSON.stringify
    "email":email
    "password":password
    "firstName":firstName
    "lastName":lastName
  root.xhrFacebookRegister.send(newUser)
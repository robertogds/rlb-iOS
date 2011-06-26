root.xhrRegister = Titanium.Network.createHTTPClient()

root.xhrRegister.onload = (e) ->
  root.newAccountWindow.remove(root.loadingView)
  root.editAccountWindow.remove(root.loadingView)
  response = JSON.parse(this.responseText)
  if response.status is 200
    root.user = response.content
    Titanium.App.Properties.setString("user",JSON.stringify(root.user))
    root.loginView.hide()
    root.loggedView.show()
    root.newAccountWindow.close()
    root.editAccountWindow.close()
  else
    Ti.API.error 'response.detail'
    alert 'Error: ' + response.detail

root.xhrRegister.onerror = (e) ->
  root.newAccountWindow.remove(root.loadingView)
  alert(Ti.Locale.getString('errorHappened') + e)
  Ti.API.error(e)

root.doRegister = (email,password,firstName,lastName,id) ->
  root.xhrRegister.setTimeout(5000)
  if id > 0
    url = root.urlSignature("/user/" + id)
    signature = root.doSignature(url)
    url = root.surl + url + '/' + signature
    proto = 'PUT'
  else
    password = Titanium.Utils.md5HexDigest(password)
    url = root.url + "/users"
    proto = 'POST'  
  root.xhrRegister.open(proto,url)
  root.xhrRegister.setRequestHeader("Content-Type","application/json; charset=utf-8")
  root.xhrRegister.setRequestHeader("Accept-Language",Titanium.Locale.currentLanguage)
  newUser = JSON.stringify
    "email":email
    "password":password
    "firstName":firstName
    "lastName":lastName
  root.xhrRegister.send(newUser)

root.validateNewAccountData = (email,password,firstName,lastName) ->
  return Ti.Locale.getString('errorEmail') unless email.length > 3
  return Ti.Locale.getString('errorPassword') unless password.length > 3
  return Ti.Locale.getString('errorFirstName') unless firstName.length > 0
  return Ti.Locale.getString('errorLastName') unless lastName.length > 0
  return true
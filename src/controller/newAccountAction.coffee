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
  alert('sale por onerror' + e)
  Ti.API.error(e)

root.doRegister = (email,password,firstName,lastName,id) ->
  root.xhrRegister.setTimeout(5000)
  if id > 0
    url = root.url + "/user/"+id 
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
  return 'Email incorrecto' unless email.length > 3
  return 'Password incorrecto, debe tener al menos 4 caracteres' unless password.length > 3
  return 'Nombre vacío' unless root.firstName.length > 0
  return 'Apellidos vacío' unless root.lastName.length > 0
  return true
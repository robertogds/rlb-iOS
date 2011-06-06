root.xhrLogin = Titanium.Network.createHTTPClient()

root.xhrLogin.onload = (e) ->
  login = JSON.parse(this.responseText)
  if login.status is 200
    root.userEmail = login.content 
    Titanium.App.Properties.setString("userEmail",root.userEmail);
    root.loginView.hide()
    root.loggedView.show()
    1
  else
    alert('Error ' + login.detail)

root.xhrLogin.onerror = (e) ->
  alert('se ha producido un error')
  Ti.API.error(e)

root.doLogin = (email,password) ->
  root.xhrLogin.setTimeout(5000)
  root.xhrLogin.open("POST","https://rlb-back.appspot.com/users/login")
  root.xhrLogin.setRequestHeader("Content-Type","application/json; charset=utf-8")
  root.xhrLogin.send(JSON.stringify({"email":email, "password":password}))
  1
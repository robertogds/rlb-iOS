root.xhrLogin = Titanium.Network.createHTTPClient()

root.xhrLogin.onload = (e) ->
  login = JSON.parse(this.responseText)
  if login.status is 200
    user = login.content
    root.userEmail = user.email 
    Titanium.App.Properties.setString("userEmail",root.userEmail);
    root.loginView.hide()
    root.loggedView.show()
    root.loggedLabel.text = "Estas logado como " + root.userEmail
    root.loggedView.add(root.loggedLabel)
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
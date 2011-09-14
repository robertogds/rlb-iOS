root.xhrLogin = Titanium.Network.createHTTPClient()

root.xhrLogin.onload = (e) ->
  try
    login = JSON.parse(this.responseText)
  catch error
    Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:L('errorHappened') + '\n' + error}).show()
  if login.status is 200
    root.user = login.content
    Titanium.App.Properties.setString("user",JSON.stringify(root.user))
    root.loginView.hide()
    root.loggedView.show()
    root.loadLoggedUser()  
  else
    Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:'Error: ' + login.detail}).show()
  root.hideLoading(root.accountWindow)

root.xhrLogin.onerror = (e) ->
  root.showError()
  Ti.API.error(e)

root.doLogin = (email,password) ->
  root.xhrLogin.setTimeout(15000)
  root.xhrLogin.open("POST",root.surl+"/users/login")
  root.xhrLogin.setRequestHeader("Content-Type","application/json; charset=utf-8")
  root.xhrLogin.setRequestHeader("Accept-Language",Titanium.Locale.currentLanguage)
  root.xhrLogin.send(JSON.stringify({"email":email, "password":password}))

root.validateLoginData = (email,password) ->
  return Ti.Locale.getString('errorEmail') unless email.length > 3
  return Ti.Locale.getString('errorPassword') unless password.length > 3
  return true
root.xhrRegister = Titanium.Network.createHTTPClient()

root.xhrRegister.onload = (e) ->
  response = JSON.parse(this.responseText)
  if response.status is 201
    newUser = response.content
    root.doLogin(newUser.email,newUser.password)
    #root.tabGroup.activeTab.open(root.accountWindow,{animated:true})
    root.newAccountWindow.close()
  else
    alert 'Error: ' + response.detail

root.xhrRegister.onerror = (e) ->
  alert('sale por onerror' + e)
  Ti.API.error(e)

root.doRegister = (email,password,firstName,lastName) ->
  root.xhrRegister.setTimeout(5000)
  root.xhrRegister.open("POST","http://rlb-back.appspot.com/users")
  root.xhrRegister.setRequestHeader("Content-Type","application/json; charset=utf-8")
  newUser = JSON.stringify
    "email":email
    "password":Titanium.Utils.md5HexDigest(password)
    "firstName":firstName
    "lastName":lastName
  root.xhrRegister.send(newUser)
  1
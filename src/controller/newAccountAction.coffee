root.xhrRegister = Titanium.Network.createHTTPClient()

root.xhrRegister.onload = (e) ->
  #loginresp = JSON.parse(this.responseText)
  alert('sale por onload ' + this.responseText)

root.xhrRegister.onerror = (e) ->
  alert('sale por onerror' + e)
  Ti.API.error(e)

root.doRegister = (email,password,firstName,lastName) ->
  root.xhrRegister.setTimeout(5000)
  root.xhrRegister.open("POST","http://rlb-back.appspot.com/users")
  root.xhrRegister.setRequestHeader("Content-Type","application/json; charset=utf-8")
  newUser = JSON.stringify
    "email":email
    "password":password
    "firstName":firstName
    "lastName":lastName
  root.xhrRegister.send(newUser)
  1
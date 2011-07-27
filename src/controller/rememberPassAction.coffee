root.xhrRemember = Titanium.Network.createHTTPClient()

root.xhrRemember.onerror = (e) ->
  root.showError()
  Ti.API.error(e)

root.xhrRemember.onload = (e) ->
  response = JSON.parse(this.responseText)
  if response.status is 200
    alert response.detail
    root.rememberPassWindow.close()
  else
    alert('Error: ' + response.detail)

root.doRememberPass = (email) ->
  root.xhrRemember.setTimeout(5000)
  root.xhrRemember.open("POST",root.url+"/users/remember")
  root.xhrRemember.setRequestHeader("Content-Type","application/json; charset=utf-8")
  root.xhrRemember.setRequestHeader("Accept-Language",Titanium.Locale.currentLanguage)
  root.xhrRemember.send(JSON.stringify({"email":email}))
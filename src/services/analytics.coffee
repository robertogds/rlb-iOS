root.xhrTrack = Titanium.Network.createHTTPClient()
root.track = (event) ->
	trackURL = 'http://reallybooking.com'
	if Titanium.Network.online isnt false
		root.xhrTrack.setTimeout(15000)
		root.xhrTrack.open('GET', trackURL+'/'+event+'.html')
		root.xhrTrack.setRequestHeader("Accept-Language",Titanium.Locale.currentLanguage)
		root.xhrTrack.send()
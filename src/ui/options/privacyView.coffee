privacyScrollView = Titanium.UI.createScrollView
  contentWidth:'auto'
  contentHeight:'auto'
  top: 0
  showVerticalScrollIndicator:true

title = L('privacyPolicy')
text = L('privacyText')

root.privacyView =  new root.GenericTextView(0,title,text)

privacyScrollView.add(root.privacyView.view)
root.privacyWindow.add(privacyScrollView)


root.xhrPrivacy = Titanium.Network.createHTTPClient()

root.xhrPrivacy.onload = () ->
  response = JSON.parse(this.responseText)
  privacyText = response.content
  root.privacyWindow.remove(root.loadingView)
  root.privacyView.textLabel.text = privacyText

root.xhrPrivacy.onerror = () ->
  alert 'Se produjo un error'
  root.privacyWindow.remove(root.loadingView)
  root.showError()

root.showPrivacy = () ->
  if Titanium.Network.online is false
    alert L('mustInternet')
    root.showError()
  else
    root.tabGroup.activeTab.open(root.privacyWindow,{animated:true})
    root.privacyWindow.add(root.loadingView)
    root.xhrPrivacy.open('GET', root.url+'/info/privacy')
    root.xhrPrivacy.setRequestHeader("Accept-Language",Titanium.Locale.currentLanguage)
    root.xhrPrivacy.send()
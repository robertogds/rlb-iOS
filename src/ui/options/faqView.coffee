faqScrollView = Titanium.UI.createScrollView
	contentWidth:'auto'
	contentHeight:'auto'
	top: 0
	showVerticalScrollIndicator:true

title = 'FAQ'

root.faqView =  new root.GenericTextView(0,title,'')

faqScrollView.add(root.faqView.view)
root.faqWindow.add(faqScrollView)


root.xhrFAQ = Titanium.Network.createHTTPClient()

root.xhrFAQ.onload = () ->
	response = JSON.parse(this.responseText)
	faqText = response.content
	root.hideLoading(root.faqWindow)
	root.faqView.textLabel.text = faqText

root.xhrFAQ.onerror = () ->
	Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:L('errorHappened')}).show()
	root.hideLoading(root.faqWindow)
	root.showError()

root.showFAQ = () ->
	if Titanium.Network.online is false
		Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:L('mustInternet')}).show()
		root.showError()
	else
		root.tabGroup.activeTab.open(root.faqWindow,{animated:true})
		root.showLoading(root.faqWindow)
		root.xhrFAQ.open('GET', root.faqUrl)
		root.xhrFAQ.setRequestHeader("Accept-Language",Titanium.Locale.currentLanguage)
		root.xhrFAQ.send()
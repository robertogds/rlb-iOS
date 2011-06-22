supportView = Titanium.UI.createView
  background: 'transparent'
  borderWidth: 0
  width:320
  top: 0

title = L('supportTitle')
text = L('supportText')

supportTextView =  new root.GenericTextView(0,title,text).view

contactView = new root.Generic2RowsView(200,'Email info@reallylatebooking.com','Llamar ')
contactView.table.height = 40

contactView.label1.addEventListener 'click', (e) ->
  emailDialog = Titanium.UI.createEmailDialog()
  emailDialog.subject = L('needHelp')
  emailDialog.toRecipients = ['info@reallylatebooking.com']
  emailDialog.open()

contactView.label2.addEventListener 'click', (e) ->
  #phone = '+442081234567'
  #Ti.Platform.openURL('tel:'+phone)

supportView.add(supportTextView) 
supportView.add(contactView.view)

root.supportWindow.add(supportView)



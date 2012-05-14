supportView = Titanium.UI.createView
  background: 'transparent'
  borderWidth: 0
  top: 0

title = L('supportTitle')
text = L('supportText')

supportTextView =  new root.GenericTextView(0,title,text).view

contactView = new root.Generic2RowsView(200,'soporte@reallylatebooking.com','+34 911 86 30 81')
#contactView.table.height = 44

contactView.label1.addEventListener 'click', (e) ->
  emailDialog = Titanium.UI.createEmailDialog()
  emailDialog.subject = L('needHelp')
  emailDialog.toRecipients = ['soporte@reallylatebooking.com']
  emailDialog.open()

contactView.label2.addEventListener 'click', (e) ->
  phone = '+34911863081'
  Ti.Platform.openURL('tel:'+phone)

supportView.add(supportTextView) 
supportView.add(contactView.view)

root.supportWindow.add(supportView)
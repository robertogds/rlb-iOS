title = L('forHotelsTitle')
text = L('forHotelsText')

forHotelsView =  new root.GenericTextView(0,title,text).view

contactView = new root.Generic2RowsView(200,'Email hoteles@reallylatebooking','Llamar ')
contactView.table.height = 40

contactView.label1.addEventListener 'click', (e) ->
  emailDialog = Titanium.UI.createEmailDialog()
  emailDialog.subject = L('forHotelsSubject')
  emailDialog.toRecipients = ['hoteles@reallylatebooking.com']
  emailDialog.open()

root.forHotelsWindow.add(forHotelsView)
root.forHotelsWindow.add(contactView.view)

title = '¿Podemos Ayudarte?'
text = 'Estamos disponibles 24x7 para asegurarnos que tus planes salgan bien.\n\n'
text = text + 'Si tienes cualquier problema no dudes en ponerte en contacto con nosotros'

supportView =  new root.GenericTextView(0,title,text).view

contactView = new root.Generic2RowsView(200,'Email ayuda@reallylatebooking.com','Llamar 902 122 234')

contactView.label1.addEventListener 'click', (e) ->
  emailDialog = Titanium.UI.createEmailDialog()
  emailDialog.subject = "Necesito Ayuda"
  emailDialog.toRecipients = ['info@reallylatebooking.com']
  emailDialog.open()

contactView.label2.addEventListener 'click', (e) ->
  phone = '+442081234567'
  Ti.Platform.openURL('tel:'+phone)
 
supportView.add(contactView.view)
root.supportWindow.add(supportView)



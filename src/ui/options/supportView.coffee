supportView = Titanium.UI.createView
  background: 'transparent'
  borderWidth: 0
  width:320
  top: 0

title = '¿Podemos Ayudarte?'
text = 'Estamos disponibles 24x7 para asegurarnos que tus planes salgan bien.\n\n'
text = text + 'Si tienes cualquier problema no dudes en ponerte en contacto con nosotros'

supportTextView =  new root.GenericTextView(0,title,text).view

contactView = new root.Generic2RowsView(200,'Email ayuda@reallylatebooking.com','Llamar 902 122 235')

contactView.label1.addEventListener 'click', (e) ->
  alert 'clica'
  emailDialog = Titanium.UI.createEmailDialog()
  emailDialog.subject = "Necesito Ayuda"
  emailDialog.toRecipients = ['info@reallylatebooking.com']
  emailDialog.open()

contactView.label2.addEventListener 'click', (e) ->
  phone = '+442081234567'
  Ti.Platform.openURL('tel:'+phone)

supportView.add(supportTextView) 
supportView.add(contactView.view)

root.supportWindow.add(supportView)



Ti.include(
  '/js/logoutButton.js'
)
root.loggedView = Titanium.UI.createView
  background: "transparent"
  borderWidth: 0
  width: 320
  top: 1

root.loggedLabel = Titanium.UI.createLabel
  borderWidth: 0
  color: '#fff'
  left: 5
  font:
    fontSize: 14
    fontWeight: 'bold'
  height: 30
  width: 300
  top: 1

customerView = new root.Generic2RowsView(150,'Soporte a usuario','Danos tu opinión')

customerView.label1.addEventListener 'click', (e) ->
  root.tabGroup.activeTab.open(root.supportWindow,{animated:true})

customerView.label2.addEventListener 'click', (e) ->
  emailDialog = Titanium.UI.createEmailDialog()
  emailDialog.subject = "Feedback about ReallyLateBooking"
  emailDialog.toRecipients = ['info@reallylatebooking.com']
  #emailDialog.messageBody = ''
  emailDialog.open()

root.loggedView.add(root.loggedLabel)
root.loggedView.add(customerView.view)
root.loggedView.add(root.logoutButton)
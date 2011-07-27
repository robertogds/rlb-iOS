root.loggedFacebookView = Titanium.UI.createView
  backgroundColor: "transparent"
  borderWidth: 0
  width: 320
  top: 1

customerView = new root.Generic2RowsView(200,Ti.Locale.getString('userSupport'),Ti.Locale.getString('feedback'))

customerView.label1.addEventListener 'click', (e) ->
  root.tabGroup.activeTab.open(root.supportWindow,{animated:true})

customerView.label2.addEventListener 'click', (e) ->
  emailDialog = Titanium.UI.createEmailDialog()
  emailDialog.subject = Ti.Locale.getString('feedbackEmailSubject')
  emailDialog.toRecipients = ['info@reallylatebooking.com']
  emailDialog.open()

facebookButton = Titanium.Facebook.createLoginButton 
  top: 60
  style: "wide"

#facebookButton.addEventListener 'click', (e) ->
#  alertDialog = Titanium.UI.createAlertDialog
#    title: 'ReallyLateBooking'
#    message:L('logoutAlert')
#    buttonNames: ['OK','Cancel']
  #alertDialog.show()

root.loggedFacebookView.add(facebookButton)
root.loggedFacebookView.add(customerView.view)
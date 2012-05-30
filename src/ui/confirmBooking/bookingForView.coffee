root.bookingForView = Titanium.UI.createView
  backgroundColor:'#0d1e28'
  width: Ti.Platform.displayCaps.platformWidth

root.bookingForTable = Titanium.UI.createTableView
  top: 5
  height: 132
  width: '95%'
  borderWidth:0
  borderRadius: 10
  scrollable: false
  moving: false
  backgroundColor: '#fff'

firstNameText = Titanium.UI.createTextField
  backgroundColor: '#fff'
  width: '100%'
  color:'#336699'
  hintText: Ti.Locale.getString('firstName')
  clearOnEdit: false
  paddingLeft: 10
  returnKeyType: Titanium.UI.RETURNKEY_NEXT

firstNameText.addEventListener 'return', (e) ->
  lastNameText.focus()

lastNameText = Titanium.UI.createTextField
  backgroundColor: '#fff'
  width: '100%'
  color:'#336699'
  hintText: Ti.Locale.getString('lastName')
  clearOnEdit: false
  paddingLeft: 10
  returnKeyType: Titanium.UI.RETURNKEY_NEXT

lastNameText.addEventListener 'return', (e) ->
  emailText.focus()

emailText = Titanium.UI.createTextField
  backgroundColor: '#fff'
  width: '100%'
  color:'#336699'
  hintText: Ti.Locale.getString('email')
  clearOnEdit: false
  paddingLeft: 10
  keyboardType: Titanium.UI.KEYBOARD_EMAIL
  returnKeyType: Titanium.UI.RETURNKEY_NEXT

emailText.addEventListener 'return', (e) ->
  email = emailText.value
  firstName = firstNameText.value
  lastName = lastNameText.value
  validate = root.validateBookingForData(email,firstName,lastName)
  if validate isnt true
    Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:L('reviewData') + ': ' + validate}).show()


root.bookingForSection = Titanium.UI.createTableViewSection()
root.bookingForData = []
firstNameRow = Titanium.UI.createTableViewRow
  width: '100%'
  height: 44
lastNameRow = Titanium.UI.createTableViewRow
  width: '100%'
  height: 44
emailRow = Titanium.UI.createTableViewRow
  width: '100%'
  height: 44

firstNameRow.add(firstNameText)
lastNameRow.add(lastNameText)
emailRow.add(emailText)

root.bookingForSection.add(firstNameRow)
root.bookingForSection.add(lastNameRow)
root.bookingForSection.add(emailRow)

bookingForLabel = Titanium.UI.createLabel
  top: 150
  height:140
  text: L('bookingForExplain')
  left: 8
  color: '#fff'
  font:
    fontSize: 14
    #fontWeight: 'bold'
root.bookingForView.add(bookingForLabel)

bookingForButton = new root.GenericButton(330,Ti.Locale.getString('change')).button

bookingForButton.addEventListener 'click', (e) ->
  validate = root.validateBookingForData(emailText.value,firstNameText.value,lastNameText.value)
  if validate is true
    root.bookingForEmail = emailText.value
    root.bookingForFirstName = firstNameText.value
    root.bookingForLastName = lastNameText.value
    root.bookingForWindow.close()  
  else
    Ti.UI.createAlertDialog({title:'ReallyLateBooking',message:L('reviewData') + ': '+ validate}).show()


root.bookingForView.add(bookingForButton)


root.bookingForData[0] = root.bookingForSection
root.bookingForTable.data = root.bookingForData
root.bookingForView.add(root.bookingForTable)
root.bookingForWindow.add(root.bookingForView)

root.validateBookingForData = (email,firstName,lastName) ->
  return Ti.Locale.getString('errorEmail') unless email.length > 3
  return Ti.Locale.getString('errorFirstName') unless firstName.length > 0
  return Ti.Locale.getString('errorLastName') unless lastName.length > 0
  return true
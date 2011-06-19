root.rememberPassView = Titanium.UI.createView
  backgroundImage: 'images/background1.png'
  width:320

title = "¿Has olvidado tu contraseña?"
text = "Introduce el email que usaste para registrate y te enviaremos una nueva."
rememberView =  new root.GenericTextView(0,title,text).view

rememberTable = Titanium.UI.createTableView
  top: 120
  height: 40
  width: 300
  borderWidth:0
  borderRadius: 10
  scrollable: false
  moving: false

rememberEmailText = Titanium.UI.createTextField
  color:'#336699'
  hintText: 'Email'
  paddingLeft: 10
  clearOnEdit: false

rememberEmailText.addEventListener 'return', (e) ->
  email = rememberEmailText.value
  root.doRememberPass(email)

section = Titanium.UI.createTableViewSection()
data = []
row = Titanium.UI.createTableViewRow()
row.add(rememberEmailText)
section.add(row)
data[0] = section
rememberTable.data = data

root.rememberPassView.add(rememberView)
root.rememberPassView.add(rememberTable)
root.rememberPassWindow.add(root.rememberPassView)

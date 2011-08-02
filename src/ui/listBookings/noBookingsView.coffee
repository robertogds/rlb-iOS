root.noBookingsView = Titanium.UI.createView
  backgroundColor: '#0d1e28'
  #width:320

title = L('bookingTonight')
text = L('yetNoBook')

noBookingsView =  new root.GenericTextView(0,title,text).view

root.noBookingsView.add(noBookingsView)
root.bookingsWindow.add(root.noBookingsView)
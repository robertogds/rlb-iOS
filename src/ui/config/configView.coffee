root.configView = Titanium.UI.createView
  background: 'transparent'
  borderWidth: 0
  width:320
  top: 0

customerView = new root.InfoView(10,'Soporte a usuario','Danos tu opinión').view
acercaView = new root.InfoView(120,'Acerca de ReallyLateBooking','Para los Hoteles').view
legalView = new root.InfoView(230,'Términos de uso','Política de privacidad').view

root.configView.add(customerView)
root.configView.add(acercaView)
root.configView.add(legalView)
root.configWindow.add(root.configView)
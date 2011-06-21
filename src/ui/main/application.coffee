Titanium.UI.setBackgroundColor('#000')

# Application Windows
root.citiesWindow = new root.GenericWindow(Ti.Locale.getString('cities'),'').win
root.listDealsWindow = new root.GenericWindow('Madrid','Loading').win
root.listDealsMapWindow = new root.GenericWindow('Mapa','Mapa').win
root.bookingsWindow = new root.GenericWindow('Tus Reservas','Reservas').win
root.accountWindow = new root.GenericWindow('Perfil','Mi Perfil').win
root.oneDealWindow = new root.GenericWindow('','').win
root.oneBookingWindow = new root.GenericWindow('Reserva','').win
root.optionsWindow = new root.GenericWindow('Opciones','Opciones').win
root.imagesWindow = new root.GenericWindow('Fotos','Fotos').win
root.newAccountWindow = new root.GenericWindow('Nueva Cuenta','').win
root.editAccountWindow = new root.GenericWindow('Editar Cuenta','').win
root.confirmBookingWindow = new root.GenericWindow('Confirmar','Confirmar').win
root.closedWindow = new root.GenericWindow('Cerrado','Cerrado').win
root.supportWindow = new root.GenericWindow('Soporte Usuario','').win
root.errorWindow = new root.GenericWindow('Error','Error').win
root.aboutWindow = new root.GenericWindow('Acerca de','').win
root.forHotelsWindow = new root.GenericWindow('Para los hoteles','').win
root.termsWindow = new root.GenericWindow('Términos de uso','').win
root.privacyWindow = new root.GenericWindow('Privacidad','').win
root.rememberPassWindow = new root.GenericWindow('Reset Password','').win


root.imagesWindow.backButtonTitle = 'Volver'
root.imagesWindow.tabBarHidden = true

# Application Tabs 336699
root.tabGroup = Titanium.UI.createTabGroup
  barColor:'#000'
  id:'tabGroup'

root.dealsTab = Titanium.UI.createTab
  icon:'icons/icon_deal.png'
  title:'Ciudades'
  window: root.citiesWindow
  
root.bookingTab = Titanium.UI.createTab
  icon:'icons/icon_buy.png'
  title:'Reservas'
  window: root.bookingsWindow
    
root.accountTab = Titanium.UI.createTab
  icon:'icons/icon_user.png'
  title:'Perfil'
  window: root.accountWindow

root.optionsTab = Titanium.UI.createTab
  icon:'icons/icon_conf.png'
  title:'Opciones'
  window: root.optionsWindow

root.tabGroup.addTab(root.dealsTab)
root.tabGroup.addTab(root.bookingTab)
root.tabGroup.addTab(root.accountTab)
root.tabGroup.addTab(root.optionsTab)
root.tabGroup.open()

root.showError = () ->
  root.errorWindow = new root.GenericWindow('Error','Error').win
  root.errorWindow.add(root.errorView)
  root.errorWindow.open
    modal:true
    modalTransitionStyle: Ti.UI.iPhone.MODAL_TRANSITION_STYLE_FLIP_HORIZONTAL,
    modalStyle: Ti.UI.iPhone.MODAL_PRESENTATION_FORMSHEET
    navBarHidden:true

Titanium.UI.setBackgroundColor('#000')

# Application Windows
root.citiesWindow = new root.GenericWindow('Ciudades','Lista de ciudades').win
root.listDealsWindow = new root.GenericWindow('Madrid','Cargando Ofertas Disponibles...').win
root.bookWindow = new root.GenericWindow('Tus Reservas','Reservas').win
root.accountWindow = new root.GenericWindow('Perfil','Mi Perfil').win
root.oneDealWindow = new root.GenericWindow('','').win
root.configWindow = new root.GenericWindow('Opciones','Opciones').win
root.imagesWindow = new root.GenericWindow('Fotos','Fotos').win
root.newAccountWindow = new root.GenericWindow('Nueva Cuenta','Nueva Cuenta').win

root.imagesWindow.backButtonTitle = 'Volver'
root.imagesWindow.tabBarHidden = true

# Application Tabs 336699
root.tabGroup = Titanium.UI.createTabGroup
  barColor:'#000'

root.dealsTab = Titanium.UI.createTab
  icon:'icons/ico_deal.png'
  title:'Ciudades'
  window: root.citiesWindow
  
root.bookTab = Titanium.UI.createTab
  icon:'icons/ico_buy.png'
  title:'Reservas'
  window: root.bookWindow
    
root.accountTab = Titanium.UI.createTab
  icon:'icons/ico_user.png'
  title:'Perfil'
  window: root.accountWindow

root.configTab = Titanium.UI.createTab
  icon:'icons/ico_conf.png'
  title:'Opciones'
  window: root.configWindow

root.tabGroup.addTab(root.dealsTab)
root.tabGroup.addTab(root.bookTab)
root.tabGroup.addTab(root.accountTab)
root.tabGroup.addTab(root.configTab)
root.tabGroup.open()


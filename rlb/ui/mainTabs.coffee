class MainTabs
  constructor: () ->
    @dealsTab = Titanium.UI.createTab({
      icon:'KS_nav_views.png',
      title:'Ofertas',
      window: root.dealsWindow.win
    })
    @bookTab = Titanium.UI.createTab({
      icon:'KS_nav_ui.png',
      title:'Reservas',
      window: root.bookWindow.win
    })
    @tabConfig = Titanium.UI.createTab({
      icon:'KS_nav_ui.png',
      title:'Configuración',
      window: root.configWindow.win
    })
root.MainTabs = MainTabs

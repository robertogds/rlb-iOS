(function() {
  Titanium.UI.setBackgroundColor('#fff');
  root.listDealsWindow = new root.GenericWindow('Madrid', 'Cargando Ofertas Disponibles...');
  root.bookWindow = new root.GenericWindow('Tus Reservas', 'Página de reservas');
  root.configWindow = new root.GenericWindow('Configuración', 'Página de configuración');
  root.tabGroup = Titanium.UI.createTabGroup({
    barColor: '#000'
  });
  root.dealsTab = Titanium.UI.createTab({
    icon: 'icons/ico_deal.png',
    title: 'Ofertas',
    window: root.listDealsWindow.win
  });
  root.bookTab = Titanium.UI.createTab({
    icon: 'icons/ico_buy.png',
    title: 'Reservas',
    window: root.bookWindow.win
  });
  root.tabConfig = Titanium.UI.createTab({
    icon: 'icons/ico_conf.png',
    title: 'Ajustes',
    window: root.configWindow.win
  });
  root.tabGroup.addTab(root.dealsTab);
  root.tabGroup.addTab(root.bookTab);
  root.tabGroup.addTab(root.tabConfig);
  root.tabGroup.open();
}).call(this);

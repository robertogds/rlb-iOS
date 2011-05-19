(function() {
  Titanium.UI.setBackgroundColor('#fff');
  root.listDealsWindow = new root.GenericWindow('Madrid', 'Cargando Ofertas Disponibles...');
  root.bookWindow = new root.GenericWindow('Tus Reservas', 'Mis Reservas');
  root.accountWindow = new root.GenericWindow('Perfil', 'Mi Perfil');
  root.oneDealWindow = new root.GenericWindow('', '').win;
  root.bookWindow = new root.GenericWindow('Confirmar Reserva', '').win;
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
  root.accountTab = Titanium.UI.createTab({
    icon: 'icons/ico_user.png',
    title: 'Ajustes',
    window: root.accountWindow.win
  });
  root.tabGroup.addTab(root.dealsTab);
  root.tabGroup.addTab(root.bookTab);
  root.tabGroup.addTab(root.accountTab);
  root.tabGroup.open();
}).call(this);

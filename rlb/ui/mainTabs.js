(function() {
  var MainTabs;
  MainTabs = (function() {
    function MainTabs() {
      this.dealsTab = Titanium.UI.createTab({
        icon: 'KS_nav_views.png',
        title: 'Ofertas',
        window: root.dealsWindow.win
      });
      this.bookTab = Titanium.UI.createTab({
        icon: 'KS_nav_ui.png',
        title: 'Reservas',
        window: root.bookWindow.win
      });
      this.tabConfig = Titanium.UI.createTab({
        icon: 'KS_nav_ui.png',
        title: 'Configuración',
        window: root.configWindow.win
      });
    }
    return MainTabs;
  })();
  root.MainTabs = MainTabs;
}).call(this);

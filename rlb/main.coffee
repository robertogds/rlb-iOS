tabGroup = Titanium.UI.createTabGroup({	barColor:'#336699'})

Titanium.UI.setBackgroundColor('#000')
 
root.dealsWindow = new root.GenericWindow('Madrid','Cargando Ofertas Disponibles...')
root.bookWindow = new root.GenericWindow('Tus Reservas','Página de reservas')
root.configWindow = new root.GenericWindow('Configuración','Página de configuración')
root.mainTabs = new root.MainTabs()

tabGroup.addTab(root.mainTabs.dealsTab)
tabGroup.addTab(root.mainTabs.bookTab)
tabGroup.addTab(root.mainTabs.tabConfig)
 
tabGroup.open()

Ti.include('rlb/ui/DealsTable.js');

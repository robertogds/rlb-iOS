root.tabGroup = Titanium.UI.createTabGroup({	barColor:'#336699'})

Titanium.UI.setBackgroundColor('#000')
 
root.dealsWindow = new root.GenericWindow('Madrid','Cargando Ofertas Disponibles...')
root.bookWindow = new root.GenericWindow('Tus Reservas','Página de reservas')
root.configWindow = new root.GenericWindow('Configuración','Página de configuración')
root.mainTabs = new root.MainTabs()

root.tabGroup.addTab(root.mainTabs.dealsTab)
root.tabGroup.addTab(root.mainTabs.bookTab)
root.tabGroup.addTab(root.mainTabs.tabConfig)
 
root.tabGroup.open()

root.dealsWindow.win.add(root.dealsTable)
# Esto en Android no funciona el include así, ya que estamos en la carpeta rlb, tiene sentido
# Hay que sacar los includes fuera para que vaya bien con todos
#Ti.include('rlb/ui/DealsTable.js');


# This will handle the JSON
xhrDeals = Titanium.Network.createHTTPClient()

xhrDeals.onload = () ->
  deals = JSON.parse(this.responseText)
  data = []

  for deal in deals
    dealRow = new root.RowDeal(deal)
    data.push(dealRow.row)
  root.dealsTable.setData(data)

# This will pull the data from the webservice
xhrDeals.open('GET', 'http://rlb-back.appspot.com/deals')
xhrDeals.send()

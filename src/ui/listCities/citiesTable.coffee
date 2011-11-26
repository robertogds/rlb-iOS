footerView = Titanium.UI.createView
    backgroundColor:'#0d1e28' 
    borderWidth: 0
    height:100
    #width:320

root.citiesTable = Titanium.UI.createTableView
  data: []
  backgroundColor: '#0d1e28'
  separatorColor: '#1b3c50'
  footerView: footerView

root.citiesWindow.add(root.citiesTable)

root.citiesTable.addEventListener 'click', (e) ->
  if e.row.city isnt undefined
    Ti.API.info 'Entra en click a ciudad'
    root.showLoading(root.citiesWindow,L('updatingHotels'))
    root.loadDeals(e.row.city)
 

root.populateCitiesTable = (cities) ->
  root.citiesWindow.remove(root.errorView)
  data = []
  textRow = new root.GenericTextRow().row
  textRow.backgroundGradient = 
    type:'linear'
    colors:[{color:'#07151d',position:0.1},{color:'#07151d',position:1.0}]
  textLabel = Titanium.UI.createLabel
    text: L('citiesToday')
    color: '#fff'
    font:
      fontSize: 12
    left: 10
    width: '90%'
  textRow.add(textLabel)
  data.push(textRow)
  for city in cities
    cityRow = new root.citiesRow(city)
    data.push(cityRow.row)
  root.citiesTable.setData(data)
  root.hideLoading(root.countriesWindow)
  root.hideLoading(root.citiesWindow)
  root.tabGroup.activeTab.open(root.citiesWindow,{animated:true})
  Ti.API.error 'TERMINA CARGA CIUDADES'


  
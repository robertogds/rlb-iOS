root.oneDealButtonBarView = Titanium.UI.createView
  background: 'transparent'
  borderWidth: 0
  width:320
  top: 0

root.oneDealButtonBar = Titanium.UI.createButtonBar
  labels:['Reservar', 'Info', 'Mapa', 'Fotos']
  backgroundColor:'#000'
  backgroundFocusedColor: '#fff'
  top:0
  style:Titanium.UI.iPhone.SystemButtonStyle.BAR
  height:40
  width:320

root.oneDealButtonBarView.add root.oneDealButtonBar

root.oneDealButtonBar.addEventListener 'click', (e) ->
  if e.index is 0
    root.oneDealWindow.remove root.infoDealScrollView
    root.oneDealWindow.remove root.mapView
    root.oneDealWindow.add root.oneDealView
  else if e.index is 1
    root.oneDealWindow.remove root.oneDealView 
    root.oneDealWindow.remove root.mapView
    root.oneDealWindow.add root.infoDealScrollView
  else if e.index is 2
    root.oneDealWindow.remove root.oneDealView
    root.oneDealWindow.remove root.infoDealScrollView
    root.oneDealWindow.add root.mapView  
  else if e.index is 3
    root.imagesAdd()
    root.imagesWindow.add(root.imagesScrollView)
    root.tabGroup.activeTab.open(root.imagesWindow,{animated:true})  
  1

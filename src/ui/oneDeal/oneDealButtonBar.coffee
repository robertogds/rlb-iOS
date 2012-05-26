root.oneDealButtonBarView = Titanium.UI.createView
	background: 'transparent'
	top: 0

root.oneDealButtonBar = Ti.UI.iOS.createTabbedBar
	labels:[L('booking'), L('info'), L('map'), L('photos')]
	backgroundColor:'#000'
	backgroundFocusedColor: '#fff'
	top:0
	style:Titanium.UI.iPhone.SystemButtonStyle.BAR
	height:40
	
root.lastIndex = 0

root.oneDealButtonBarView.add root.oneDealButtonBar

root.oneDealButtonBar.addEventListener 'click', (e) ->
	Ti.API.info '***** BUTTONBAR INDEX =' + e.index
	if e.index is 0
		root.lastIndex = 0
		root.oneDealWindow.remove root.infoDealTable
		root.oneDealWindow.remove root.mapView
		root.oneDealWindow.add root.oneDealView
	else if e.index is 1
		root.lastIndex = 1
		root.oneDealWindow.remove root.oneDealView 
		root.oneDealWindow.remove root.mapView
		root.oneDealWindow.add root.infoDealTable
	else if e.index is 2
		root.lastIndex = 2
		root.oneDealWindow.remove root.oneDealView
		root.oneDealWindow.remove root.infoDealTable
		root.oneDealWindow.add root.mapView 
	else if e.index is 3
		root.oneDealButtonBar.setIndex(root.lastIndex)
		root.imagesWindow.add(root.imagesScrollView)
		root.tabGroup.tabs[root.dealsTab.pos].open(root.imagesWindow,{animated:true})
		Ti.API.info 'CLIK EN FOTOS'
	1

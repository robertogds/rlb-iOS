root.dealsTable = Titanium.UI.createTableView
  data: []
  backgroundColor: '#fff'

root.dealsTable.addEventListener 'click', (e) ->
  root.cargarDeal(e.row.deal)
  root.tabGroup.activeTab.open(root.oneDealWindow,{animated:true});




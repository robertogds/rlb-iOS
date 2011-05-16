root.dealsTable = Titanium.UI.createTableView
  data: []
  backgroundColor: 'transparent'

root.dealsTable.addEventListener 'click', (e) ->
  root.cargarDeal(e.row.deal)
  root.tabGroup.activeTab.open(root.dealWindow,{animated:true});




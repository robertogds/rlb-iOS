(function() {
  root.dealsTable = Titanium.UI.createTableView({
    data: [],
    backgroundColor: '#fff'
  });
  root.dealsTable.addEventListener('click', function(e) {
    root.cargarDeal(e.row.deal);
    return root.tabGroup.activeTab.open(root.oneDealWindow, {
      animated: true
    });
  });
}).call(this);

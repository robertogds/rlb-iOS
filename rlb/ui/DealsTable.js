(function() {
  root.dealsTable = Titanium.UI.createTableView({
    data: [],
    backgroundColor: 'transparent'
  });
  root.dealsTable.addEventListener('click', function(e) {
    root.cargarDeal(e.row.deal);
    return root.tabGroup.activeTab.open(root.dealWindow, {
      animated: true
    });
  });
}).call(this);

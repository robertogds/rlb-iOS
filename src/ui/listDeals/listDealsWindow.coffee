Ti.include(
  '/js/why3View.js'
  '/js/ListDealsRow.js'
  '/js/listDealsMapView.js'
  '/js/listDealsTable.js'
  '/js/pullRefresh.js'
  '/js/noDealsView.js'
)
# OJO ANDROID VERSION con el include del pullRefresh

root.listDealsWindow.addEventListener 'focus', (e) ->
  #alert 'Focus en el listado de deals'
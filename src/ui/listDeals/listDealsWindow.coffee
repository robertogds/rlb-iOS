Ti.include(
  '/js/DealHeaderView.js'
  '/js/why3View.js'
  '/js/ListDealsRow.js'
  '/js/listDealsMapView.js'
  '/js/listDealsTable.js'
  '/js/noDealsView.js'
)

if (Titanium.Platform.name isnt 'android')
  Ti.include('/js/pullRefresh.js')

root.listDealsWindow.addEventListener 'focus', (e) ->
  #alert 'Focus en el listado de deals'
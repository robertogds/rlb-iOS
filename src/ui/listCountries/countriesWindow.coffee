Ti.include(
  '/js/countriesRow.js'
  '/js/countriesTable.js'
)
root.countriesWindow.addEventListener 'focus', (e) ->
  root.currentWindow = 'countries'
  now = new Date()
  diffTime = now.getTime() - root.countriesDate.getTime()
  Ti.API.info 'last countries updated: ' + root.countriesDate.toLocaleDateString() + 'difftime: ' + diffTime
  if diffTime > 86400000
    root.showCountries()
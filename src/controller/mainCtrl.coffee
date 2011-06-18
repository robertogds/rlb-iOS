Ti.include(
  '/js/GenericWindow.js'
  '/js/Generic2RowsView.js'
  '/js/GenericTextRow.js'
  '/js/GenericTextView.js'
  '/js/GenericButton.js'
  '/js/GenericMapAnnotation.js'
  '/js/errorView.js'
  '/js/application.js'
  '/js/accountWindow.js'
  '/js/bookingsWindow.js'
  '/js/ListDealsRow.js'
  '/js/listDealsTable.js'
  '/js/oneDealView.js'
  '/js/oneBookingView.js'
  '/js/loadingView.js'
  '/js/accountView.js'
  '/js/testView.js'
  '/js/configView.js'
  '/js/bookingView.js'
  '/js/citiesTable.js'
  '/js/aboutView.js'
  '/js/forHotelsView.js'
  '/js/termsView.js'
  '/js/privacyView.js'
)

root.url = 'http://rlb-back.appspot.com'
root.surl = 'https://rlb-back.appspot.com'

if Titanium.App.Properties.hasProperty("user")
  root.user = JSON.parse(Titanium.App.Properties.getString("user"))
  Ti.API.info(root.user)

root.showCities()



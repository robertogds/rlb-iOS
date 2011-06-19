root.url = 'http://rlb-back.appspot.com'
root.surl = 'https://rlb-back.appspot.com'


Ti.include(
  '/js/GenericWindow.js'
  '/js/Generic2RowsView.js'
  '/js/GenericRowView.js'
  '/js/GenericTextRow.js'
  '/js/GenericButton.js'
  '/js/GenericMapAnnotation.js'
  '/js/GenericTextView.js'
  '/js/loadingView.js'
  '/js/errorView.js'
  '/js/application.js'
  '/js/listDealsWindow.js'
  '/js/accountWindow.js'
  '/js/bookingsWindow.js'
  '/js/oneDealView.js'
  '/js/oneBookingView.js'
  '/js/accountView.js'
  '/js/testView.js'
  '/js/optionsView.js'
  '/js/bookingView.js'
  '/js/citiesTable.js'
  '/js/aboutView.js'
  '/js/forHotelsView.js'
  '/js/termsView.js'
  '/js/privacyView.js'
)


if Titanium.App.Properties.hasProperty("user")
  root.user = JSON.parse(Titanium.App.Properties.getString("user"))
  Ti.API.info(root.user)

root.showCities()



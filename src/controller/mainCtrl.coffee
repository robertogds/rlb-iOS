root.url = 'http://rlb-back.appspot.com'
root.surl = 'https://rlb-back.appspot.com'
#root.url = 'http://192.168.1.33:9000'
#root.surl = 'http://192.168.1.33:9000'
root.country = 'spain'
root.countriesDate = new Date()
root.cell = {}

root.bgGradient =
     type:'linear'
     colors:[{color:'#07151d',position:0.1},{color:'#0d1e28',position:1.0}]

Ti.include(
	'/js/mocks.js'
	'/js/staticCities.js'
	'/js/staticZones.js'
	#'/js/sharekit.js'
    #'/js/gpsData.js'
	'/js/fetchDeals.js'
    '/js/dateUtil.js'
    '/js/GenericWindow.js'
    '/js/GenericSeparatorView.js'
    '/js/Generic2RowsView.js'
    '/js/GenericRowView.js'
    '/js/GenericNightView.js'
    '/js/GenericTextRow.js'
    '/js/GenericButton.js'
    '/js/GenericMapAnnotation.js'
    '/js/GenericTextView.js'
    '/js/GenericMapRightButtonView.js'
    '/js/GenericAndroidTab.js'
    '/js/errorView.js'
    '/js/loadingView.js'
    '/js/application.js'
    '/js/listDealsWindow.js'
    '/js/accountWindow.js'
    '/js/bookingsWindow.js'
    '/js/citiesWindow.js'
    '/js/showDeal.js'
    '/js/oneBookingView.js'
    '/js/optionsView.js'
	'/js/bookingView.js'
    '/js/aboutView.js'
    '/js/forHotelsView.js'
    '/js/termsView.js'
    '/js/privacyView.js'
	'/js/loadUser.js'
)

# Main Program
root.loadUser()
#root.initializeGPS()



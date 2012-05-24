Ti.include(
	'/js/creditsTable.js'
	'/js/noCreditsView.js'
	'/js/creditsPullRefresh.js'
)


root.listCreditsWindow.addEventListener 'focus', (e) ->
	if Titanium.App.Properties.hasProperty("user") or Titanium.Facebook.loggedIn
		root.showCredits()
	else
		root.noCreditsView.show()
	1
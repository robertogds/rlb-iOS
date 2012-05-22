Ti.include(
	'/js/validateCoupon.js'
	'/js/newCouponView.js'
	'/js/balanceView.js'
	'/js/creditsView.js'
	'/js/noLoginCreditsView.js'
)

if root.isLogged()
	root.creditsWindow.add(root.creditsView)
else
	root.creditsWindow.add(root.noLoginCreditsView)
	
root.creditsWindow.addEventListener 'focus', (e) ->
	Ti.API.info 'Entra en focus'
	if root.isLogged()
		root.creditsWindow.remove(root.noLoginCreditsView)
		root.fetchCredits()
		root.showLoading(root.creditsWindow)
		root.creditsWindow.add(root.creditsView)
	else
		root.creditsWindow.remove(root.creditsView)
		root.creditsWindow.add(root.noLoginCreditsView)
	1
Ti.include(
	'/js/CreditsRow.js'
	'/js/fetchCreditsTable.js'
)

root.creditsTable = Titanium.UI.createTableView
	data: []
	backgroundColor: 'transparent'
	separatorColor: '#1b3c50'

root.listCreditsWindow.add(root.creditsTable)

root.populateCreditsTable = (credits) ->
	Ti.API.info 'Entra en creditTable con ' + credits.length
	if credits.length is undefined or credits.length is 0
		Ti.API.info '*** ENTRA EN NO HAY CREDITOS'
		root.listCreditsWindow.add(root.noCreditsView)
		root.noCreditsView.show()
	else
		data = []
		for credit in credits
			creditRow = new root.CreditsRow(credit)
			data.push(creditRow.row)
		root.noCreditsView.hide()
		root.creditsTable.setData(data)
	root.creditsTable.footerView = root.footerView
	root.hideLoading(root.listCreditsWindow)
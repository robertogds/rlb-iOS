Ti.include(
	'/js/CreditsRow.js'
	'/js/fetchCreditsTable.js'
)

root.footerView = Titanium.UI.createView
	backgroundColor:'transparent' 
	borderWidth: 0
	height:100
	width:Ti.UI.FILL

root.creditsTable = Titanium.UI.createTableView
	data: []
	backgroundColor: 'transparent'
	separatorColor: '#1b3c50'

root.listCreditsWindow.add(root.creditsTable)

root.populateCreditsTable = (credits) ->
	data = []
	for credit in credits
		creditRow = new root.CreditsRow(credit)
		data.push(creditRow.row)
	if data.length is 0
		Ti.API.info '*** ENTRA EN NO HAY CREDITOS'
		root.listCreditsWindow.add(root.noCreditsView)
		root.noCreditsView.show()
	else
		root.noCreditsView.hide()
		root.creditsTable.setData(data)
	root.creditsTable.footerView = root.footerView
	root.hideLoading(root.listCreditsWindow)
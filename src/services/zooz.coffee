
root.zoozButton = Ti.UI.createButton
	title: "Purchase..."
	height:50
	width:250
	bottom:20


root.zoozButton.addEventListener 'click',  (e) ->
	Ti.API.info "payBtn clicked"
	zoozmodule = require('com.zooz.ti')
	zoozmodule.doPayment
		data:
			amount: root.cantidadText.value
			currencyCode: "EUR"
			appKey: "4b71ac79-9338-4cc0-91ad-220572fd54b3"
			isSandbox: false
			email: ''
			
		success: (data) ->
			Ti.API.info 'Result success!'
			Ti.UI.createAlertDialog({ title: "Transaction Completed",message: "TransactionId: " + data.transactionId}).show()
		
		error: (data) ->
			Ti.API.info 'Callback error called.'
			Ti.UI.createAlertDialog({title: "Transaction Failed",message: "Error Code: " + data.errorCode + " ; Error Message: " + data.errorMessage}).show()
			
		cancel: (data) ->
			Ti.API.info 'Callback cancel called.'
			Ti.UI.createAlertDialog({title: "Transaction Aborted"}).show()


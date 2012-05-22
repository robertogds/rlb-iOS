class GenericMenuTable
	constructor: (top,rows) ->
		@view = Titanium.UI.createView
			background: 'transparent'
			top:top
		table = Titanium.UI.createTableView
			top: 0
			height: 44 * rows 
			width: '95%'
			borderWidth:0
			borderRadius: 10
			scrollable: false
			moving: false
		@section = Titanium.UI.createTableViewSection()
		data = []
		data[0] = @section
		table.data = data
		@view.add(table)
root.GenericMenuTable = GenericMenuTable
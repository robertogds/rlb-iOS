class CityRow
	constructor: (city1,city2,city3) ->
		@row = Ti.UI.createTableViewRow
			height: 107
			hasChild: false
			selectionStyle: 'none'
			backgroundColor: 'transparent'
			#borderColor:'black'
			#borderWidth: 1	
		root.cell[city1.name] = new root.cityCell(@row,city1,0)
		if city2 isnt undefined
			root.cell[city2.name] = new root.cityCell(@row,city2,107)
		if city3 isnt undefined
			root.cell[city3.name] = new root.cityCell(@row,city3,214)

root.cityRow = CityRow
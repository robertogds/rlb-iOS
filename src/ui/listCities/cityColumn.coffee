class CityColumn
	constructor: (city1,city2,city3) ->
		@row = Ti.UI.createTableViewRow
			height: 91
			hasChild: false
			selectionStyle: 'none'
			backgroundColor: 'transparent'
			#backgroundGradient:
			#	type:'linear'
			#	colors:[{color:'#07151d',position:0.1},{color:'#0d1e28',position:1.0}]
    	
		row1 = new root.cityRow(@row,city1,0)
		row2 = new root.cityRow(@row,city2,106)
		row3 = new root.cityRow(@row,city3,212)
		

root.cityColumn = CityColumn
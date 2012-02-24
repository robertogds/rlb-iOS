class CityCell
	constructor: (row,city,left) ->   
		@cityImage = Titanium.UI.createImageView
			image: city.image
			city: city
			left: left 
			width: 105
			height: 105
			open: false
			top:0
		@inactiveView = Titanium.UI.createView
			backgroundColor : 'black'
			opacity: 0.6
			height: 107
			width: 107
			visible: false
			top: 0
			left: left
			cityName: city.name
		
		borderView = Titanium.UI.createView
			backgroundColor : 'black'
			color: 'black'
			height: 107
			width: 107
			visible: true
			top: 0
			left: left

		@cityLabel = Titanium.UI.createLabel
			text: L(city.url)
			color: 'white'
			textAlign: 'center' 
			font:
				fontSize: 14
				fontWeight: 'bold'
			left: left 
			height:18
			width:107
			top: 88

		@cityBarLabel = Titanium.UI.createLabel
			borderWidth: 0
			backgroundColor: 'black'
			opacity: 0.3
			color: '#fff'
			left: left
			height: 18
			width: 107
			top: 89

		row.add(borderView)
		row.add(@cityImage)
		row.add(@cityBarLabel)
		row.add(@cityLabel)
		row.add(@inactiveView)
		

		@inactiveView.addEventListener 'click', (e) ->
			root.activateCells()
		@cityImage.addEventListener 'click', (e) ->
			city = e.source.city
			cell = root.cell[city.name]
			#if city.hasZones is true
			#	if e.source.open is false
			#		root.deactivateCells(city.name)
			#		e.source.open = true 
			#		row = Ti.UI.createTableViewRow
			#			height: 60
			#		left = 0
			#		for zone in root.zones[city.url]
			#			zoneCell = new root.zoneCell(row,zone,city,left)
			#			left = left + 80
			#		root.citiesTable.insertRowAfter(city.row,row)
			#		Ti.API.info '*** row index = ' + row.getIndex
			#	else root.activateCells()
			#else	
			root.showLoading(root.citiesWindow,L('updatingHotels'))
			root.loadDeals(e.source.city)
		
root.cityCell = CityCell
	

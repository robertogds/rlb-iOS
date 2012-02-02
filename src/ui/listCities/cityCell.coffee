class CityCell
	constructor: (row,city,left) ->   	
		@cityImage = Titanium.UI.createImageView
			borderRadius: 0
			borderWidth: 1
			borderColor: 'black'
			image: city.image
			city: city
			left: left 
			width: 107
			height: 107
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
		
		@cityLabel = Titanium.UI.createLabel
			text: city.name
			color: 'white'
			textAlign: 'center' 
			font:
				fontSize: 14
				fontWeight: 'bold'
			left: left 
			height:14
			width:107
			top: 90

		@cityBarLabel = Titanium.UI.createLabel
			borderWidth: 0
			backgroundColor: 'black'
			opacity: 0.3
			color: '#fff'
			left: left
			height: 18
			width: 107
			top: 89

		
		row.add(@cityImage)
		row.add(@cityBarLabel)
		row.add(@cityLabel)
		row.add(@inactiveView)

		@inactiveView.addEventListener 'click', (e) ->
			root.activateCells()
		@cityImage.addEventListener 'click', (e) ->
			city = e.source.city
			cell = root.cell[city.name]
			if city.hasZones is true
				if e.source.open is false
					root.deactivateCells(city.name)
					e.source.open = true 
					row = Ti.UI.createTableViewRow
						height: 60
					left = 0
					for zone in root.zones[city.url]
						zoneCell = new root.zoneCell(row,zone,left)
						left = left + 80
					root.citiesTable.insertRowAfter(city.row,row)
				else root.activateCells()
			else	
				root.showLoading(root.citiesWindow,L('updatingHotels'))
				root.loadDeals(e.source.city)
		
root.cityCell = CityCell
	

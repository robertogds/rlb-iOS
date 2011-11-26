class CityRow
	constructor: (row,city,left) ->    	
		cityImage = Titanium.UI.createImageView
			borderRadius: 10
			borderWidth: 0
			#borderColor: '#1b3c50'
			borderColor: 'white'
			image: city.image
			city: city
			left: left + 10
			width: 90
			height: 68
			open: false
		
		cityLabel = Titanium.UI.createLabel
			text: city.name
			color: '#fff'
			textAlign: 'center' 
			font:
				fontSize: 11
				fontWeight: 'bold'
			left: left
			height:12
			width:80
			top: 75

		cityBarLabel = Titanium.UI.createLabel
			borderWidth: 0
			#backgroundColor: '#0d1e28'
			backgroundColor: 'black'
			opacity: 0.6
			color: '#fff'
			left: left
			height: 12
			width: 80
			top: 0

		
		row.add(cityImage)
		#row.add(cityBarLabel)
		#row.add(cityLabel)
		
		cityImage.addEventListener 'click', (e) ->
			city = e.source.city
			if city.hasZones is true 
				if e.source.open is false 
					e.source.open = true
					e.source.borderWidth = 2
					e.source.borderColor = 'black'
					row = Ti.UI.createTableViewRow
						height: 120
						backgroundColor : 'black'
					left = 0
					for zone in root.zones[city.url]
						zoneRow = new root.cityRow(row,zone,left)
						left = left + 80
					root.citiesTable.insertRowAfter(1,row)
				else 
					root.citiesTable.deleteRow(2)
					e.source.borderWidth = 1
					e.source.borderColor = '#1b3c50'
					e.source.open = false
		
	root.cityRow = CityRow
	

class CityRow
	constructor: (row,city,left) ->    	
		cityImage = Titanium.UI.createImageView
			borderRadius: 0
			borderWidth: 1
			#borderColor: '#1b3c50'
			borderColor: 'black'
			image: city.image
			city: city
			left: left 
			width: 107
			height: 107
			open: false
			top:0
		
		cityLabel = Titanium.UI.createLabel
			text: city.name
			color: 'white'
			textAlign: 'center' 
			font:
				fontSize: 13
				fontWeight: 'bold'
			left: left 
			height:12
			width:107
			top: 93

		cityBarLabel = Titanium.UI.createLabel
			borderWidth: 0
			#backgroundColor: '#0d1e28'
			backgroundColor: 'black'
			opacity: 0.6
			color: '#fff'
			left: left
			height: 15
			width: 107
			top: 91

		
		row.add(cityImage)
		row.add(cityBarLabel)
		row.add(cityLabel)
		
		cityImage.addEventListener 'click', (e) ->
			city = e.source.city
			root.showLoading(root.citiesWindow,L('updatingHotels'))
			root.loadDeals(e.source.city)
		
	root.cityRow = CityRow
	

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
				fontSize: 14
				fontWeight: 'bold'
			left: left 
			height:14
			width:107
			top: 90

		cityBarLabel = Titanium.UI.createLabel
			borderWidth: 0
			backgroundColor: 'black'
			opacity: 0.3
			color: '#fff'
			left: left
			height: 18
			width: 107
			top: 89

		
		row.add(cityImage)
		row.add(cityBarLabel)
		row.add(cityLabel)
		
		cityImage.addEventListener 'click', (e) ->
			city = e.source.city
			root.showLoading(root.citiesWindow,L('updatingHotels'))
			root.loadDeals(e.source.city)
		
	root.cityRow = CityRow
	

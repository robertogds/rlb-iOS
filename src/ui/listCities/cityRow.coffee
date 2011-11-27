class CityRow
	constructor: (row,city,left) ->    	
		cityImage = Titanium.UI.createImageView
			borderRadius: 0
			borderWidth: 0
			#borderColor: '#1b3c50'
			borderColor: 'white'
			image: city.image
			city: city
			left: left + 8
			width: 100
			height: 89
			open: false
			top:2
		
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
			root.showLoading(root.citiesWindow,L('updatingHotels'))
			root.loadDeals(e.source.city)
		
	root.cityRow = CityRow
	

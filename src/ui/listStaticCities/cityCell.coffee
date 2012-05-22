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
			backgroundColor : '#0d1e28'
			opacity: 1
			height: 107
			width: 107
			visible: false
			top: 0
			left: left
			cityName: 'More Cities'
		
		moreCitiesLabel = Titanium.UI.createLabel
			text: 'Ver Más Ciudades'
			width: 107
			textAlign: 'center'
			height: 107
			top: 0
			color: 'white'
			font:
				fontSize: 16
				fontWeight: 'bold'
		@inactiveView.add(moreCitiesLabel)
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
			root.showAllCities()
		@cityImage.addEventListener 'click', (e) ->
			Ti.API.info '*** Entra en click'
			city = e.source.city
			cell = root.cell[city.name]	
			root.showLoading(root.citiesWindow,L('updatingHotels'))
			Ti.API.info '*** LLama a loadDeals'
			root.loadDeals(e.source.city)
		
root.cityCell = CityCell
	

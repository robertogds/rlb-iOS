class OtherCityRow
	constructor: (city) ->
		@row = Ti.UI.createTableViewRow
			hasChild: true
			height: Ti.UI.SIZE
			#rightImage: '/images/yellow_arrow.png'
			backgroundGradient: root.bgGradientTitle
			city: city
		cityLabel = Titanium.UI.createLabel
			text: city.name
			color: '#fff'
			font:
				fontSize: 12
				fontWeight: 'bold'
			left: 10
			height: 30
		@row.add(cityLabel)
	
root.OtherCityRow = OtherCityRow
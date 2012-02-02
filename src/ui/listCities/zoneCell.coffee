class ZoneCell
	constructor: (row,zone,left) ->    	
		zoneImage = Titanium.UI.createImageView
			borderRadius: 0
			borderWidth: 1
			borderColor: 'black'
			image: zone.image
			city: zone
			left: left 
			width: 80
			height: 60
			#top:0
		zoneLabel = Titanium.UI.createLabel
			text: zone.name
			color: 'black'
			textAlign: 'center' 
			font:
				fontSize: 12
				fontWeight: 'bold'
			left: left 
			height:18
			width:80
			#top: 55

		zoneBarLabel = Titanium.UI.createLabel
			borderWidth: 0
			backgroundColor: 'black'
			opacity: 0.3
			color: '#fff'
			left: left
			height: 18
			width: 107
			#top: 55
			
		row.add(zoneImage)
		#row.add(zoneBarLabel)
		row.add(zoneLabel)
		
		zoneImage.addEventListener 'click', (e) ->
			root.showLoading(root.citiesWindow,L('updatingHotels'))
			root.loadDeals(e.source.city)
		
root.zoneCell = ZoneCell
	

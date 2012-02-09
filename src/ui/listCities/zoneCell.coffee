class ZoneCell
	constructor: (row,zone,city,left) ->   	
		zoneImage = Titanium.UI.createImageView
			borderRadius: 0
			borderWidth: 1
			borderColor: 'black'
			image: zone.image
			zoneIndex: zone.index
			zoneUrl: zone.url
			city: city
			left: left 
			width: 80
			height: 60
			#top:0
		zoneLabel = Titanium.UI.createLabel
			text: L(zone.url)
			color: 'black'
			textAlign: 'center' 
			font:
				fontSize: 12
				fontWeight: 'bold'
			left: left 
			height:60
			width:80
			#top: 55
			
		row.add(zoneImage)
		row.add(zoneLabel)
		
		zoneImage.addEventListener 'click', (e) ->
			root.showLoading(root.citiesWindow,L('updatingHotels'))
			Ti.API.info 'metemos zone' + e.source.zoneName
			root.zoneIndex = e.source.zoneIndex
			root.zoneUrl = e.source.zoneUrl
			root.loadDeals(e.source.city)		
		
root.zoneCell = ZoneCell
	

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
			width: 79
			height: 59
			#top:0
		borderView = Titanium.UI.createView
			backgroundColor : 'black'
			color: 'black'
			height: 80
			width: 60
			visible: true
			left: left
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
		
		row.add(borderView)	
		row.add(zoneImage)
		row.add(zoneLabel)
		
		zoneImage.addEventListener 'click', (e) ->
			root.showLoading(root.citiesWindow,L('updatingHotels'))
			Ti.API.info 'metemos zone' + e.source.zoneName
			root.zoneIndex = e.source.zoneIndex
			root.zoneUrl = e.source.zoneUrl
			root.loadDeals(e.source.city)		
		
root.zoneCell = ZoneCell
	

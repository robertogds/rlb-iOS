class PullRefreshHeader
	constructor: () ->
		@view = Ti.UI.createView
			backgroundColor: '#090d0f'
			width:'100%'
			height:60
			
		border = Ti.UI.createView
			backgroundColor:"#576c89"
			height:2
			bottom:0
			
		@arrow = Ti.UI.createView
			backgroundImage:"/images/whiteArrow.png"
			width:23
			height:60
			bottom:10
			left:20
		
		@statusLabel = Ti.UI.createLabel
			text:"Pull to reload"
			left:55
			width:200
			bottom:30
			height:"auto"
			color: '#cdcece'
			textAlign:"center"
			font:{fontSize:13,fontWeight:"bold"}
			shadowColor:"#111"
			shadowOffset:{x:0,y:1}
		
		@lastUpdatedLabel = Ti.UI.createLabel
			text:"Last Updated: "+ root.formatDate()
			left:55
			width:200
			bottom:15
			height:"auto"
			color: '#cdcece'
			textAlign:"center"
			font:{fontSize:12}
			shadowColor:"#111"
			shadowOffset:{x:0,y:1}
		
		@actInd = Titanium.UI.createActivityIndicator
			left:20
			bottom:13
			width:30
			height:30
		
		@view.add(border)
		@view.add(@arrow)
		@view.add(@statusLabel)
		@view.add(@lastUpdatedLabel)
		@view.add(@actInd)
		 
root.PullRefreshHeader = PullRefreshHeader




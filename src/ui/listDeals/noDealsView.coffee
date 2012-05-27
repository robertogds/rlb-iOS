root.noDealsView = Titanium.UI.createView
	backgroundColor: 'black'
	width: '100%'
	#backgroundImage: '/images/Texture.jpg'

#closedView =  new root.GenericTextView(0,L('noDealsTitle'),L('noDealsText')).view
#root.noDealsView.add(closedView)
root.noDealsWindow.add(root.noDealsView)

countDown =  ( hours, minutes , seconds, fn_tick, fn_end  ) ->
	totalSeconds:hours * 3600 + minutes * 60 + seconds
	timer:this.timer
	set: (hours,minutes,seconds)->
		this.totalSeconds = parseInt(hours) * 3600 + parseInt(minutes) * 60 + parseInt(seconds)
		this.time = {hours:hours,minutes:minutes,seconds:seconds}
		return this
	start: ()->
		self = this
		this.timer = setInterval( ()->
			if (self.totalSeconds)
				self.totalSeconds--
				secs = self.totalSeconds
				h = parseInt(secs/3600)
				secs -= h * 3600
				mins = parseInt(secs/60)
				secs -= mins * 60
				self.time = { hours: h, minutes : mins, seconds: (secs % 60) }
				fn_tick()
			else
				self.stop()
				fn_end()
		1000)
		return this
 

leadingZero = (time)->
	if time < 10
		return '0'+time
	else
		return time

myTick = ()->
	countDownLabel.text = leadingZero(myTimer.time.hours) + ":" + leadingZero(myTimer.time.minutes) + ":" + leadingZero(myTimer.time.seconds)
	
openCities = ()->
	alert 'ABRIMOS!'
	
myTimer = new countDown(1,5,30,myTick,openCities)

#interface

countDownLabel =  Titanium.UI.createLabel
	text:''
	height:80
	width:320
	top:100
	left:0
	color:'#fff'
	borderRadius:10
	backgroundColor:'#000'
	font:
		fontSize:50
		fontWeight:'bold'
	textAlign:'center'




root.noDealsView.add(countDownLabel)

root.showNoDeals = ()->
	myTimer.set(1,1,10)
	myTimer.start()
	root.tabGroup.tabs[root.dealsTab.pos].open(root.noDealsWindow,{animated:true})
	
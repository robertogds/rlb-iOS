root.noDealsView = Titanium.UI.createView
	#backgroundColor: 'black'
	width: '100%'
	backgroundImage: '/images/Texture.jpg'

root.closedCityView =  new root.GenericTextView(0,L('noDealsTitle'),L('noDealsText')).view
root.waitingCityView =  new root.GenericTextView(0,L('waitingDealsTitle'),L('waitingDealsText')).view
root.closedCityView.visible = false
root.noDealsView.add(root.closedCityView)
root.noDealsView.add(root.waitingCityView)
root.noDealsWindow.add(root.noDealsView)

root.noDealsWindow.addEventListener 'close', (e) ->
	myTimer.stop()

countDown =  ( hours, minutes , seconds, fn_tick, fn_end  ) ->
	totalSeconds:hours * 3600 + minutes * 60 + seconds
	timer:this.timer
	set: (totalSeconds)->
		Ti.API.info 'Entra con milisegundos = ' + totalSeconds
		#this.totalSeconds = parseInt(hours) * 3600 + parseInt(minutes) * 60 + parseInt(seconds)
		this.totalSeconds = totalSeconds
		h = parseInt(totalSeconds/3600)
		totalSeconds -= h * 3600
		mins = parseInt(totalSeconds/60)
		totalSeconds -= mins * 60
		this.time = {hours:h,minutes:mins,seconds:totalSeconds}
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
	stop: ()->
		clearInterval(this.timer)
		this.time = {hours:0,minutes:0,seconds:0}
		this.totalSeconds = 0
		return this
 

leadingZero = (time)->
	if time < 10
		return '0'+time
	else
		return time

myTick = ()->
	countDownLabel.text = leadingZero(myTimer.time.hours) + ":" + leadingZero(myTimer.time.minutes) + ":" + leadingZero(myTimer.time.seconds)
	
openCities = ()->
	root.noDealsWindow.close()
	root.loadDeals(root.city)
	
myTimer = new countDown(1,5,30,myTick,openCities)

#interface

countDownLabel =  Titanium.UI.createLabel
	text:''
	height:80
	width:320
	top:250
	left:0
	color:'#fff'
	borderRadius:10
	backgroundColor:'transparent'
	font:
		fontSize:50
		fontWeight:'bold'
	textAlign:'center'


root.showNoDeals = (timeToOpen)->
	Ti.API.info 'entra en shownodeals con ' + timeToOpen
	if timeToOpen is undefined
		root.noDealsView.remove(countDownLabel)
		root.waitingCityView.visible = false
		root.closedCityView.visible = true
	else
		Ti.API.info 'entre en waiting city'
		root.noDealsView.add(countDownLabel)
		root.closedCityView.visible = false
		root.waitingCityView.visible = true
		myTimer.set(parseInt(timeToOpen/1000))
		myTimer.start()
	root.tabGroup.tabs[root.dealsTab.pos].open(root.noDealsWindow,{animated:true})
	
# TODO Usar esto para avisar si han pasado las 12 de que la app ya está abierta
Ti.API.info "hello from a background service"

notification = Titanium.App.iOS.scheduleLocalNotification
	alertBody:"Kitchen Sink was put in background"
	alertAction:"Re-Launch!"
	userInfo:{"hello":"world"}
	sound:"pop.caf"
	date:new Date(new Date().getTime() + 3000) 

#// we cancel our notification if we don't want it to continue
#// notification.cancel(); 

Ti.App.iOS.addEventListener 'notification', ()->
	Ti.API.info 'background event received = '+notification
	Ti.App.currentService.unregister();


Ti.App.currentService.addEventListener 'stop', () ->
	Ti.API.info("background service is stopped")


#// we need to explicitly stop the service or it will continue to run
#// you should only stop it if you aren't listening for notifications in the background
#// to conserve system resources. you can stop like this:
Ti.App.currentService.stop();
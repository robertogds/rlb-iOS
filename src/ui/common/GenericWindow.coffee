class GenericWindow
	constructor: (theTitle) ->
		@win = Ti.UI.createWindow
			title:theTitle
			backgroundImage:'/images/Texture.png'
			#barImage:'/images/texture3.jpg'
root.GenericWindow = GenericWindow
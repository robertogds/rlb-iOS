class GenericWindow
	constructor: (theTitle) ->
		@win = Ti.UI.createWindow
			title:theTitle
			backgroundImage:'/images/Texture.png'
root.GenericWindow = GenericWindow
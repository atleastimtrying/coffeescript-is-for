class App
	constructor: ->
		@sections = $('section')
		console.log @sections
		$(section).css "background-color" : @randomrgb() for section in @sections

	randomrgb: ->
		"rgb(#{@roundom 180 },#{@roundom 180 },#{@roundom 180 })"

	roundom: (int)->
		Math.ceil Math.random()*int

$ ->
	window.app = new App
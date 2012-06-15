class App
	constructor: ->
		@position = 0
		@sections = $('section')
		$(section).css "background-color" : @randomrgb() for section in @sections
		$(window).keypress @keypress
		$(section).hide() for section in @sections

	randomrgb: ->
		"rgb(#{@roundom 180 },#{@roundom 180 },#{@roundom 180 })"

	roundom: (int)->
		Math.ceil Math.random()*int

	keypress: (event)=>
		@position += 1
		@position = 0 if @position > @sections.length
		$(section).hide() for section in @sections
		$(@sections[@position]).show()


$ -> window.app = new App
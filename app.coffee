class App
	constructor: ->
		@position = 0
		@sections = $('section')
		@setBackground section for section in @sections
		@displaySections()
		$(window).keypress @keypress

	displaySections: ->
		$(section).hide() for section in @sections
		$(@sections[@position]).show()

	randomrgb: -> "rgb(#{@roundom 180 },#{@roundom 180 },#{@roundom 180 })"

	roundom: (int)-> Math.ceil Math.random()*int
	
	setBackground: (section)-> $(section).css "background-color" : @randomrgb()

	keypress: (event)=>
		if event.keyCode is 32
    	@changeSection 1
    else
    	@changeSection -1

	normalizePosition: ->
		@position = 0 if @position > @sections.length
		@position = @sections.length if @position < 0

	changeSection: (modifier)->
		@position += modifier
		@normalizePosition()
		@displaySections()

$ -> window.app = new App
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$('.remover').each ->
		$(this).click (e) ->
			e.preventDefault()
			$(this).parents('div.form-group').remove()

	$('.adder').each ->
		$(this).click (e) ->
			e.preventDefault()
			model = $(this).parents('div.form-group').prevAll('.form-group').first()
			clon = $(model).clone(true, true)
			$(clon).find('label').remove()
			$(clon).insertAfter model
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

addRemoveOnClickEvent = (boton) ->
	$(boton).click (e) ->
		e.preventDefault()
		$(boton).parents('div.form-group').remove()

$ ->
	$('.remover').each ->
		addRemoveOnClickEvent(this)

	$('.adder').each ->
		$(this).click (e) ->
			e.preventDefault()
			model = $(this).parents('div.form-group').prevAll('.form-group').first()
			clon = $(model).clone(true, true)
			closeButton = $('<button>×</button>').attr({type: 'button', class: 'close equis remover'})
			addRemoveOnClickEvent(closeButton)
			$(clon).find('div.col-sm-2').html(closeButton)
			$(clon).insertAfter model

	$('form').each ->
		$(this).on("ajax:success", (e, data, status, xhr) ->
			alert(e)
			alert(data)
			alert(status)
			alert(xhr)
		)
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

addRemoveOnClickEvent = (boton) ->
	$(boton).click (e) ->
		e.preventDefault()		
		input_array = $(boton).parents('div.form-group').next('input')
		is_input= !(input_array == undefined || input_array.length == 0)
		if is_input
			destroy_input = $(input_array).clone(true, true)
			id = destroy_input.attr('id')
			name = destroy_input.attr('name')
			id = id.replace(/_id$/g, '_destroy')
			name = name.replace(/\[id\]$/g, '[_destroy]')
			destroy_input.val true
			destroy_input.attr
				id: id
				name: name
			$(destroy_input).insertAfter input_array
		$(boton).parents('div.form-group').remove()

$ ->
	new_model = $('.adder').first().parents('div.form-group').prevAll('.form-group').first()
	model= new_model.clone(true, true)
	$(model).attr id: 'new_com'
	$(model).hide()
	$(model).find('.form-control').each ->
		$(this).prop('disabled', true)
	$(model).insertBefore new_model

	$('.remover').each ->
		addRemoveOnClickEvent this
		
	$('.adder').each ->
		$(this).click (e) ->
			e.preventDefault()
			model_button = $(this).parents('div.form-group')
			model = model_button.prevAll('.comision').first()		
			is_comision = !(model == undefined || model.length == 0)				
			new_comision = $('#new_com').clone(true, true)
			$(new_comision).attr id: ''
			$(new_comision).show()
			$(new_comision).find('.form-control').each ->
				$(this).prop('disabled', false)
			closeButton = $('<button>×</button>').attr({type: 'button', class: 'close equis remover'})
			addRemoveOnClickEvent(closeButton)
			$(new_comision).find('div.col-sm-2').html(closeButton)
			if is_comision
				for input, i in $(model).find('.form-control') 			
					id = $(input).attr('id')
					name = $(input).attr('name')
					id_new = id.match(/_(\d+)_/i)
					name_new = name.match(/\[(\d+)\]/i)
					id_new = '_' + (Number(id_new[1]) + 1) + '_'
					name_new = '[' + (Number(name_new[1]) + 1) + ']'
					id = id.replace(/_\d+_/i, id_new)
					name = name.replace(/\[\d+\]/i, name_new)
					$($(new_comision).find('.form-control')[i]).attr
						id: id
						name: name
			$(new_comision).insertBefore model_button

	$('form').each ->
		$(this).on("ajax:success", (e, data, status, xhr) ->
			alert(e)
			alert(data)
			alert(status)
			alert(xhr)
		)
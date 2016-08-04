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

$(document).on "turbolinks:load", ->
	$('#new_odt .nested_attributes').each ->
		new_model = $(this).find('div').first()
		model= new_model.clone(true, true)
		$(model).attr id: $(this).data('nestedModel')
		$(model).hide()
		$(model).find('.form-control').each ->
			$(this).prop('disabled', true)
		$(model).insertBefore new_model

	$('.remover').each ->
		addRemoveOnClickEvent this
		
	$('.adder').each ->
		$(this).click (e) ->
			e.preventDefault()
			form_group_button = $(this).parents('div.form-group')
			previous_form_group = form_group_button.prevAll('.form-group').first()
			previous_input = form_group_button.prevAll('input').first()
			new_model_id = $(this).parents('div.nested_attributes').data('nestedModel')
			new_nested_model = $('#' + new_model_id).clone(true, true)
			$(new_nested_model).attr id: ''
			$(new_nested_model).show()
			$(new_nested_model).find('.form-control').each ->
				$(this).prop('disabled', false)
			closeButton = $('<button>×</button>').attr({type: 'button', class: 'close equis remover'})
			addRemoveOnClickEvent(closeButton)
			$(new_nested_model).find('div.col-sm-2').html(closeButton)
			id_input = -1
			id_previous_form_group = -1
			if previous_form_group.length
				id_previous_form_group = Number($(previous_form_group).find('.form-control').first().attr('id').match(/_(\d+)_/i)[1])			
			if previous_input.length
				id_input = Number($(previous_input).attr('id').match(/_(\d+)_/i)[1])
			id_max = Math.max(id_input, id_previous_form_group)
			if id_max >= 0
				id_max++
				for input in $(new_nested_model).find('.form-control')
					id = $(input).attr('id')
					name = $(input).attr('name')
					id = id.replace(/_\d+_/i, "_"+id_max+"_")
					name = name.replace(/\[\d+\]/i, "["+id_max+"]")
					$(input).attr
						id: id
						name: name
			$(new_nested_model).insertBefore form_group_button
	$('form').each ->
		$(this).on("ajax:success", (e, data, status, xhr) ->
			alert(e)
			alert(data)
			alert(status)
			alert(xhr)
		)
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", ->

  $('.auto_load').trigger( "click" );

  $('.revertir').each ->
    $(this).click () ->
      tbody = $('#main_table tbody')
      tbody.html $('tr', tbody).get().reverse()

  $('div.hidden').each ->
    $(this).hide()
    $(this).find('select').removeAttr 'name'

  $("select[id$='pool_category_type']").each ->
    select = $(this)
    select.data 'previous', select.val()
    select.change ->
      if $(this).data('previous')
        old_select_category_id = $('#' + $(this).data('previous') + $(this).parents('form').attr('id'))
        old_select_category_id.addClass 'hidden'
        old_select_category_id.hide()
        old_select_category_id.find('select').removeAttr 'name'
      new_select_category_id = $('#' + $(this).val() + $(this).parents('form').attr('id'))
      new_select_category_id.removeClass 'hidden'
      new_select_category_id.show()
      new_select_category_id.find('select').prop 'name', 'pool[category_id]'
      $(this).data 'previous', $(this).val()

  # enable chosen js
  $('.chosen-select').each ->
    $(this).chosen
      allow_single_deselect: true
      include_group_label_in_selected: true
      no_results_text: 'No existe'
      width: '100%'
    $(this).attr('style','display:block; position:absolute; clip:rect(0,0,0,0)')
    $(this).attr('tabindex','-1')

  $('[data-toggle="tooltip"]').tooltip()
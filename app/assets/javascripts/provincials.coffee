# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", ->

  $('div.hidden').each ->
    $(this).hide()
    $(this).find('select').removeAttr 'name'
    return
    
  $("select[id$='provincial_category_type']").each ->
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
      new_select_category_id.find('select').prop 'name', 'provincial[category_id]'
      $(this).data 'previous', $(this).val()
      return
    return
  return

  $('[data-toggle="tooltip"]').tooltip()
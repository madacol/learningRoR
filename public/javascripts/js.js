function addInput(boton){
  clonador=$(boton).parents('div.form-group').prev()
  clon=$(clonador).clone()
  $(clon).find('label').remove()
  $(clon).insertAfter(clonador)
}
function removeInput(boton){
  $(boton).parents('div.form-group').remove()
}

$(document).ready(function(){
  $('form#new_pool div.hidden select').each(function() {
    $(this).removeAttr('name');
  });
  var select = $("#pool_category_type");
  select.data("previous",select.val());
  select.change( function (){
    old_select_category_id = $('#'+$(this).data('previous'));
    old_select_category_id.addClass('hidden');
    old_select_category_id.find('select').removeAttr('name');

    new_select_category_id = $('#'+$(this).val());
    new_select_category_id.removeClass('hidden');
    new_select_category_id.find('select').prop('name', 'pool[category_id]');

    $(this).data("previous",$(this).val());
  });
});
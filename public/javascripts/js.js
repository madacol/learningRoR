function addInput(boton){
  clonador=$(boton).parents('div.form-group').prevAll(".form-group").first()
  clon=$(clonador).clone()
  $(clon).find('label').remove()
  $(clon).insertAfter(clonador)
}
function removeInput(boton){
  $(boton).parents('div.form-group').remove()
}

$( document ).ready(function() {
  $('div.hidden').each(function() {    
    $(this).hide()
    $(this).find('select').removeAttr('name');
  });
  $("select[id^='pool_category_type']").each(function() {
    var select = $(this);
    select.data( "previous",select.val() );
    select.change( function (){
      if ( $(this).data("previous") ) {
        old_select_category_id = $('#'+$(this).data('previous')+$(this).parents('form').attr('id') );
        old_select_category_id.addClass('hidden');
        old_select_category_id.hide();
        old_select_category_id.find('select').removeAttr('name');
      }
      new_select_category_id = $('#'+$(this).val()+$(this).parents('form').attr('id') );
      new_select_category_id.removeClass('hidden');
      new_select_category_id.show();
      new_select_category_id.find('select').prop('name', 'pool[category_id]');

      $(this).data("previous",$(this).val());
    });
  });  
});
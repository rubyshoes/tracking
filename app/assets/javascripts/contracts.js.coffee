# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
	$("#contract_st_date").datepicker({
			changeMonth: true,
			changeYear: true,
			yearRange: '1930:2050',
			formatDate: 'mm-dd-yy'
	});
	
	$("#contract_end_date").datepicker({
			changeMonth: true,
			changeYear: true,
			yearRange: '1930:2050',
			formatDate: 'mm-dd-yy'
  });
  
  $("#contract_clients_attributes_0_birth_date").datepicker({
	    changeMonth: true,
			changeYear: true,
			yearRange: '1930:2050',
			formatDate: 'mm-dd-yy'
  })
  
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()
    
  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()
    
  $('#contract_client_attributes_name').autocomplete
      source: $('#contract_client_attributes_name').data('autocomplete-source')

  $('#contract_codelines_attributes_0_code_attributes_code_name').autocomplete
      source: $('#contract_codelines_attributes_0_code_attributes_code_name').data('autocomplete-source')
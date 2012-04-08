# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
	$("#code_contracts_attributes_0_st_date").datepicker({
			changeMonth: true,
			changeYear: true,
			yearRange: '1930:2050',
			formatDate: 'mm-dd-yy'
	});
	$("#code_contracts_attributes_0_end_date").datepicker({
			changeMonth: true,
			changeYear: true,
			yearRange: '1930:2050',
			formatDate: 'mm-dd-yy'
  });
  $("#code_clients_attributes_0_birth_date").datepicker({
	    changeMonth: true,
			changeYear: true,
			yearRange: '1930:2050',
			formatDate: 'mm-dd-yy'
  })


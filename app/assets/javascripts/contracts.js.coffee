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
#  $("#contract_clients_birth_date").datepicker({
#			changeMonth: true,
#			changeYear: true,
#			yearRange: '1930:2050',
#			formatDate: 'mm-dd-yy'
#  });

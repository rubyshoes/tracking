# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
	$("#employee_birth_date").datepicker({
			changeMonth: true,
			changeYear: true,
			yearRange: '1930:2050'
	});
	$("#employee_hire_date").datepicker({
			changeMonth: true,
			changeYear: true,
			yearRange: '1930:2050'
	})
	$("#employee_term_date").datepicker({
			changeMonth: true,
			changeYear: true,
			yearRange: '1930:2050'
	})

# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
    $("#codeline_contract_st_date").datepicker({
            changeMonth:    true,
            changeYear:     true,
            yearRange:      '1930:2050',
            dateFormat:     'yy-mm-dd'
    });
    $("#codeline_contract_end_date").datepicker({
            changeMonth:    true,
            changeYear:     true,
            yearRange:      '1930:2050',
            dateFormat:     'yy-mm-dd'
    });
    $("#codeline_client_birth_date").datepicker({
            changeMonth:    true,
            changeYear:     true,
            yearRange:      '1930:2050',
            dateFormat:     'yy-mm-dd'
    });

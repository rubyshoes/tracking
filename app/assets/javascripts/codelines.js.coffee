# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
    $("#codeline_contract_attributes_st_date").datepicker({
            changeMonth:    true,
            changeYear:     true,
            yearRange:      '1930:2050',
            dateFormat:     'yy-mm-dd'
    });
    $("#codeline_contract_attributes_end_date").datepicker({
            changeMonth:    true,
            changeYear:     true,
            yearRange:      '1930:2050',
            dateFormat:     'yy-mm-dd'
    });
    $("#codeline_client_attributes_birth_date").datepicker({
            changeMonth:    true,
            changeYear:     true,
            yearRange:      '1930:2050',
            dateFormat:     'yy-mm-dd'
    })

jquery ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()

  $('form').on 'click', '.add_codes', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()

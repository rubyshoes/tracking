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
    select: (event, ui) -> 
      $.ajax '/get_client_data',
        type: 'GET',
        data: ui.item,
        success: (data, status, xqhr) ->
          $("#contract_client_attributes_zip_code").val(data.zip_code)
          $("#contract_client_attributes_birth_date").val(data.birth_date)
          $("#contract_client_attributes_address1").val(data.address1)
          $("#contract_client_attributes_address2").val(data.address2)
          $("#contract_client_attributes_city").val(data.city)
          $("#contract_client_attributes_state").val(data.state)
          $("#contract_client_attributes_medicare_num").val(data.medicare_num)
          $("#contract_client_attributes_medicaid_num").val(data.medicaid_num)
          $("#contract_client_attributes_member_num").val(data.member_num)
          $("#contract_client_attributes_soc_sec_care_mgr").val(data.soc_sec_care_mgr)
          $("#contract_client_attributes_sscm_ph").val(data.sscm_ph)
          $("#contract_client_attributes_nurse_care_mgr").val(data.nurse_care_mgr)
          $("#contract_client_attributes_ncm_ph").val(data.ncm_ph)
          $("#contract_client_attributes_emer_contact").val(data.emer_contact)
          $("#contract_client_attributes_ec_ph").val(data.ec_ph)
          $("#contract_client_attributes_pri_care_phy").val(data.pri_care_phy)
          $("#contract_client_attributes_pcp_ph").val(data.pcp_ph)
          

  $('#contract_codelines_attributes_0_code_attributes_code_name').autocomplete
      source: $('#contract_codelines_attributes_0_code_attributes_code_name').data('autocomplete-source')
      select: (event, ui) -> 
        $.ajax '/get_code_data',
          type: 'GET',
          data: ui.item,
          success: (data, status, xqhr) ->
            $("#contract_codelines_attributes_0_code_attributes_status").val(data.status)
            $("#contract_codelines_attributes_0_code_attributes_description").val(data.description)
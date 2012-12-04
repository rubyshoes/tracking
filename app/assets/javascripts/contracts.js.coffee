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
  
  ###
  Please see RailsCast for details regarding the Add and Remove fields logic.
  ###
  
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()
    
  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()
    $("#contract_codelines_attributes_" + time + "_code_attributes_code_name").autocomplete                     # It is necessary to add this in the add_fields function so each new element can have autocomplete added to it with the correct timestamp for the new fields.
        source: $('input[id*="code_attributes_code_name"]').data('autocomplete-source')
        select: (event, ui) ->                                                                                  # Event and UI are objects passed from jQuery UI autocomplete. Please reference that documentation for details.
          $.ajax '/get_code_data',                                                                              # This is the custom path defined to retrieve the code details. See Routes file and Code controller
            type: 'GET',
            data: ui.item,                                                                                      # This is the data (in this case, the code name) that we are passing to the Rails action in the Ajax request.
            success: (data, status, xqhr) ->                                                                    # If the Ajax request is successful, this is how we add the values returned to the appropriate elements. 
              $("#contract_codelines_attributes_" + time + "_code_attributes_status").val(data.status)          # We access the data by using the JSON response (data) and querying it for each attribute. Use .val() to set an elements value.
              $("#contract_codelines_attributes_" + time + "_code_attributes_description").val(data.description)
    
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
          
  $('input[id*="code_attributes_code_name"]').autocomplete
      source: $('input[id*="code_attributes_code_name"]').data('autocomplete-source')
      select: (event, ui) -> 
        $.ajax '/get_code_data',
          type: 'GET',
          data: ui.item,
          success: (data, status, xqhr) ->
            $("#contract_codelines_attributes_0_code_attributes_status").val(data.status)
            $("#contract_codelines_attributes_0_code_attributes_description").val(data.description)
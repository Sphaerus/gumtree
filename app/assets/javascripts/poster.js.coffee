$(document).ready ->
		
	$('#poster_range_id').change ->
		kindType = $("#poster_range_id option:selected").attr("type")
		$("[data-role=type]").val(kindType)
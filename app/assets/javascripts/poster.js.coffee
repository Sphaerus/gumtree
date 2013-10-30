$(document).ready ->
		
	$('#poster_kind_id').change ->
		kindType = $("#poster_kind_id option:selected").attr("type")
		$("[data-role=kind_type]").val(kindType)
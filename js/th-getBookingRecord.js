function submitPage(page){
	$.ajax({
		url: "pageRecord.asp",
		type: "get",
		data: {
			"page": page,
		}
	}).done(function(data){
		$(".th-booking-record").html(data);
	})
}
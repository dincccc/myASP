function submitPage(page){
	$.ajax({
		url: "am-booking-record.asp",
		type: "get",
		data: {
			"page": page,
		}
	}).done(function(data){
		$(".am-booking-record").html(data);
	})
}
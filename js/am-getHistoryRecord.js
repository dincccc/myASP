function submitPageH(page){
	$.ajax({
		url: "am-history-record.asp",
		type: "get",
		data: {
			"page": page,
		}
	}).done(function(data){
		$(".am-history-record").html(data);
	})
}
$(".status").each(function(){
	s=$(this);
	var status=s.html();
	if (status=="未通过"){
		s.css("color","red");
	}
	else if(status=="通过") {
		s.css("color","green");
	}
	else{
		/*console.log("审核中..");*/
	}
})/*状态样式*/
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
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
/*审核按钮*/
	/*批准*/
$(function(){	
	$(".reply").click(function(){
		getDate();
		var msgP=confirm("确定批准吗？");
		if(msgP==true){
			var theNode=$(this).parent().parent();
			var check_by=$(".get_am_id").attr("value");
			checkBtn(theNode,"amp",check_by);
		}else{
			console.log("Pnothing");
		}
	})
	/*拒绝*/
	$(".delete").click(function(){
		getDate();
		var msgJ=confirm("确定拒绝吗？");
		if(msgJ==true){
			var theNode=$(this).parent().parent();
			var check_by=$(".get_am_id").attr("value");
			checkBtn(theNode,"amj",check_by)
		}else{
			console.log("Jnothing");
		}
	})
})
/*end 审核按钮*/

/*审核按钮事件*/
	function checkBtn(theNode,isfrom,check_by){
		var c_week=theNode.children().eq(1).text();
		var c_day=theNode.children().eq(2).text();
		var c_lesson=theNode.children().eq(3).text();
		var c_lab_address=theNode.children().eq(4).text();
		var c_thId=theNode.attr("value");
		theNode.hide("fast",function(){
			theNode.remove();	
			$.ajax({
				url: "ischeck-del.asp",
				type: "POST",
				data: {
					"week": c_week,
					"day": c_day,
					"lesson": c_lesson,
					"lab-address": c_lab_address,
					"check-by": check_by,
					"now": now,
					"isfrom": isfrom,
					"th-id": c_thId,
				}
			}).done(function(){
				console.log("success");
			}).fail(function(){
				console.log("filed");
			})		
		})
	}
/*end 审核按钮事件*/
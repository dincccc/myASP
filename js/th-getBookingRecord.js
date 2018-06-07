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
		url: "pageRecord.asp",
		type: "get",
		data: {
			"page": page,
		}
	}).done(function(data){
		$(".th-booking-record").html(data);
	})
}
/*撤销预约按钮*/
	$(".reply").click(function(){
		var theNode=$(this).parent().parent();
		var msgR=confirm("确定撤销这条预约吗？");
		if(msgR==true){
			isReplyDel(theNode,"reply","撤销");
		}else{
			console.log("撤销");
		}
	})
/*end 删除记录按钮*/
/*删除记录按钮*/
	$(".delete").click(function(){
		var theNode=$(this).parent().parent();
		var msgD=confirm("确定删除这条记录吗？");
		if(msgD==true){
			isReplyDel(theNode,"del","删除");
		}else{
			console.log("删除");
		}
	})
/*end 删除记录按钮*/
function isReplyDel(theNode,iswhat,text){

	var c_week=theNode.children().eq(1).text();
	var c_day=theNode.children().eq(2).text();
	var c_lesson=theNode.children().eq(3).text();
	var c_lab_address=theNode.children().eq(4).text();
	console.log(theNode);
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
				"isfrom": "th",
				"iswhat": iswhat,
			}
		}).done(function(data){
			dialog(text+"成功！");
		}).fail(function(){
			dialog(text+"失败！");
		})		
	})		
}
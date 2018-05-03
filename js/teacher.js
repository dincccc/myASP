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
})


$(".keep-pwd").click(function(){
	$(".pwd-change").toggle();
	$(".info-change").hide();
	return false;
})
$(".change-info").click(function(){
	$(".info-change").toggle();
	$(".pwd-change").hide();
	return false;
})
$(".booking-exit").click(function(){
	window.location.href="../index.asp";
})
$(".confirm-ch").click(function(){

})
$(".pc-box input").each(function(){
	var _this=$(this);
	_this.blur(function(){
		if(_this.val()==""){
			_this.css("border-color","red");
		}else{
			_this.css("border-color","#3c763d");
		}
	})
})


/*删除记录按钮*/
	$(".delete").click(function(){
		var msgJ=confirm("确定删除这条记录吗？");
		if(msgJ==true){
			var theNode=$(this).parent().parent();
			var c_week=theNode.children().eq(1).text();
			var c_day=theNode.children().eq(2).text();
			var c_lesson=theNode.children().eq(3).text();
			var c_lab_address=theNode.children().eq(4).text();
			theNode.hide("fast",function(){
				theNode.remove();	
				$.ajax({
					url: "ischeck-del.asp",
					data: {
						"week": c_week,
						"day": c_day,
						"lesson": c_lesson,
						"lab-address": c_lab_address,
						"isfrom": "th",
					}
				}).done(function(data){
					console.log(data);
				}).fail(function(){
					console.log("删除失败！");
				})		
			})		
		}else{
			console.log("THnothing");
		}
	})
/*end 删除记录按钮*/

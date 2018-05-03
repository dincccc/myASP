$(function(){

/*side-left btn*/
	$(".card-header").click(function(){
		$("a.nav-link").removeClass("active");
	})
	$(".nav-link").click(function(){
		$("a.nav-link").removeClass("active");
		$(this).addClass("active");
	})
	clickCommon("#thInfoBtn");
	clickCommon("#labInfoBtn");
	clickCommon("#thInfoAddBtn");
	clickCommon("#labInfoAddBtn");
	clickCommon("#bkRecordBtn");
	clickCommon("#checkHistoryBtn");
	clickCommon("#bkRecordControlBtn");

	function clickCommon(leftID){
		$(leftID).click(function(){
			var rightID=leftID+"_tab";
			$(rightID).toggle();
			$(".tab-pane").not(rightID).hide();
		})
	}
/*end side-left btn*/

/*状态颜色*/
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
/*end 状态颜色*/

/*表单验证*/
	$("#th_submit").click(function(){
		$("input").not("[type='radio']").each(function(){
			_this=$(this);
			var id=_this.attr("id");
			if(_this.val()==""){
				amDialog("#"+id,"不能为空","red");
			}
			else{
				amDialog("#"+id,"","green");
			}
		})
	})
	$("input").not("[type='radio']").blur(function(){
		_this=$(this);
		var id=_this.attr("id");
		if(_this.val()!=""){
			amDialog("#"+id,"","green");
		}
		else{
		}
	})
	function amDialog(ID,text,color){
		$(ID).css("border-color",color);
		$(ID).next().remove();
		$(ID).after("<div class='am-dialog'>"+text+"</div>");
	}
/*end 表单验证*/

/*获取时间*/
	function getDate(){
		var date=new Date();
		var year=date.getFullYear();
		var month=date.getMonth()+1;
		var day=date.getDate();
		var hour=date.getHours();
		hour<10?hour="0"+hour:hour;
		var minute=date.getMinutes();
		minute<10?minute="0"+minute:minute;
		var second=date.getSeconds();
		second<10?second="0"+second:second;
		/*var day=date.getDay();*/
		return now=year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
	}
/*end 获取时间*/

/*审核按钮*/
	/*批准*/
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
/*end 审核按钮*/

})
/*审核按钮事件*/
	function checkBtn(theNode,isfrom,check_by){
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
					"check-by": check_by,
					"now": now,
					"isfrom": isfrom,
				}
			}).done(function(){
				console.log("success");
			}).fail(function(){
				console.log("filed");
			})		
		})
	}
/*end 审核按钮事件*/
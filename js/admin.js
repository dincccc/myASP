$(function(){

	/*side-left btn*/
	$(".card-header").click(function(){
		$("a.nav-link").removeClass("active");
	})
	$(".nav-link").click(function(){
		$("a.nav-link").removeClass("active");
		$(this).addClass("active");
	})
	$("#add_th_info_tab").click(function(){
		$("#add_th_info").toggle();
		$(".tab-pane").not("#add_th_info").hide();
	})
	$("#add_lab_info_tab").click(function(){
		$("#add_lab_info").toggle();
		$(".tab-pane").not("#add_lab_info").hide();
	})
	$("#v_bk_record_tab").click(function(){
		$("#bk_record_tab").toggle();
		$(".tab-pane").not("#bk_record_tab").hide();
	})
	$("#v_bk_record_control").click(function(){
		$("#bk_record_control").toggle();
		$(".tab-pane").not("#bk_record_control").hide();
	})
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
			console.log("审核中..");
		}
	})
	/*表单验证*/
	$("#th_submit").click(function(){


		$("input").not("[type='radio']").each(function(){
		
			_this=$(this);
			var id=_this.attr("id");
			console.log(id);
			if(_this.val()==""){
				amDialog("#"+id,"不能为空","red");
			}
			else{
				amDialog("#"+id,"","green");

			}
		
		})
	})
	function amDialog(ID,text,color){
		$(ID).css("border-color",color);
		$(ID).next().remove();
		$(ID).after("<div class='am-dialog'>"+text+"</div>");
	}
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
	/*审核按钮*/
	$(".reply").click(function(){
		getDate();
		var msgP=confirm("确定批准吗？");
		if(msgP==true){
			var theNode=$(this).parent().parent();

			var c_week=theNode.children().eq(1).text();
			var c_day=theNode.children().eq(2).text();
			var c_lesson=theNode.children().eq(3).text();
			var c_lab_address=theNode.children().eq(4).text();
			var check_by=$(".get_am_id").attr("value");
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
						"isfrom": 1,
					}
				}).done(function(){
					console.log("success");
				}).fail(function(){
					console.log("filed");
				})		
			});
		}else{
			console.log("nothing");
		}
	})
	$(".delete").click(function(){
		var msgJ=confirm("确定拒绝吗？");
		if(msgJ==true){
			console.log("jus");
		}else{
			console.log("nothing");
		}
	})

})

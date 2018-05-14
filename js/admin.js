
//↓-----------------信息查询----------------------↓

/*th_info*/

/*end th_info*/

//↑-----------------信息查询----------------------↑

//↓-----------------添加信息----------------------↓
/*add 教师信息*/
function addThInfo(){
	var th_id=$("#new_th_id").val();
	var th_name=$("#new_th_name").val();
	var th_sex_v=$("input[name='new_th_sex']:checked").val();
	var th_class=$("#new_th_class").val();
	var th_course=$("#new_th_course").val();
	var th_phone=$("#new_th_phone").val();
	var th_mail=$("#new_th_mail").val();
	var isfrom="addTh";

	if(th_sex_v=="on"){
		th_sex=1;
	}else{
		th_sex=0;
	}
	$.ajax({
		url: "addInfo.asp",
		data: {
			"th-id": th_id,
			"th-name": th_name,
			"th-sex": th_sex,
			"th-class": th_class,
			"th-course": th_course,
			"th-phone": th_phone,
			"th-mail": th_mail,
			"isfrom": isfrom,
		}
	}).done(function(data){
		dialog("AddThInfo:"+data);
	}).fail(function(xhr,status) {
        dialog("AddThInfo:"+xhr.status+","+status);
    })	
}
/*end add 教师信息*/
/*add 实验室信息*/
function addLabInfo(){
	var lab_id=$("#new_lab_id").val();
	var lab_adr=$("#new_lab_adr").val();
	var lab_type=$("#new_lab_type option:checked").attr("value");
	var lab_cap=$("#new_lab_cap").val();
	var isfrom="addLab";	
	$.ajax({
		url: "addInfo.asp",
		data: {
			"lab-id": lab_id,
			"lab-adr": lab_adr,
			"lab-type": lab_type,
			"lab-cap": lab_cap,
			"isfrom": isfrom,
		}
	}).done(function(data){
		dialog("AddLabInfo:"+data);
	}).fail(function(xhr,status) {
        dialog("AddLabInfo:"+xhr.status+","+status);
    })	
}
/*end add 实验室信息*/
/*表单验证*/

	var idCheck=false;
	var otherCheck=false;
	var classCheck=false;
	var courseCheck=false;
	var phoneCheck=false;
	var mailCheck=false;
	/*表单验证*/
	validateID("#new_th_id");
	validateOther("#new_th_name");
	validateClass("#new_th_class");
	validateCourse("#new_th_course")
	validatePhone("#new_th_phone");
	validateMail("#new_th_mail");
	$("#th_submit").click(function(){
		if(idCheck&&otherCheck&&classCheck&&courseCheck&&mailCheck&&phoneCheck){
			addThInfo();
			console.log("success!!!");
		}else{
			console.log(idCheck+"||"+otherCheck+"||"+classCheck+"||"+mailCheck+"||"+phoneCheck);
			return false;
		}

	})

$(function(){
	$("#lab_submit").click(function(){
		if($("#new_lab_id").val()==""){
			amDialog("#new_lab_id","不能为空","red");
		}
		else if ($("#new_lab_adr").val()=="") {
			amDialog("#new_lab_adr","不能为空","red");
		}else if($("#new_lab_cap").val()==""){
			amDialog("#new_lab_cap","不能为空","red");
		}else{
			amDialog("#new_lab_id","","green");
			amDialog("#new_lab_adr","","green");
			amDialog("#new_lab_cap","","green");
			addLabInfo();
			console.log("success!!!");
		}

	})
})
/*end 表单验证*/

//↑-----------------添加信息----------------------↑

//↓-----------------预约管理----------------------↓

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

/*side-left btn*/
	$(function(){
		$(".card-header").click(function(){
			$(".collapse a.nav-link").removeClass("active");
		})
		$(".collapse .nav-link").click(function(){
			$(".collapse a.nav-link").removeClass("active");
			$(this).addClass("active");
			var ID="#"+$(this).attr("id");
			clickCommon(ID);
		})
	})
	function clickCommon(leftID){
		var rightID=leftID+"_tab";
		$(rightID).toggle();
		$("div[id$='_tab']").not(rightID).hide();
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
			console.log(check_by);
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

//↑-----------------预约管理----------------------↑


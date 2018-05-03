$(".center_th_name").click(function(){
	window.location.href="asp/teacher.asp";
});/*登录|个人中心按钮*/
$(".content-shadow").click(function(){
	aside_hide();
	return false;
})
$(".table td").click(function(){
	var contant=$(this).children().prop("class");
	if(contant!="bk_active"){
		dialog("不能预约")
	}
	else{
		var x=$(this).attr("value");			/*td的value值*/
		var y=$(this).parent().attr("value");	/*tr的value值*/

		var ap=getOptionInfo();				
		var ap_address_h=ap.address_h;		/*地址html值*/
		var ap_address_v=ap.address_v;		/*地址value值*/
		var ap_week_v=ap.week_v;			/*周次value值*/

		isChoose(ap_week_v,ap_address_v
			,function(){aside_data(ap_week_v,ap_address_h,x,y);}
			,function(){dialog("请选择周次！")}
			,function(){dialog("请选择实验室！")});
	}
	return false;
})
/*申请按钮绑定事件：传送数据给asp并向数据库插入数据*/
	$("#apply").click(function(){
		getDate();/*申请日期*/
		var ap=getOptionInfo();	
		var th_id=$(".ap_id").html();
		var apl_address=ap.address_h;				/*地址html值*/
		var apl_week=ap.week_v;						/*week value值*/
		var apl_day=$(".ap_day").attr("value");								/*day value值*/
		var apl_lesson=$(".ap_lesson").attr("value");;							/*lesson value值*/
		var apl_capacity=$("#ap_students").val(); 	/*申请容量*/
		var true_capacity=$(".ap_capacity").html(); /*实验室容量*/
		var apl_cur_name=$("#ap_cur_name").val();		/*课程名称*/
		var apl_exp_name=$("#ap_exp_name").val();		/*实验名称*/
		var apl_reason=$("#ap_reason").val();		/*申请原因*/
		var apl_class=$("#ap_class option:selected").html();/*申请班级*/
		var apl_class_v=$("#ap_class option:selected").val();/*申请班级val*/

		if(apl_capacity==""||apl_reason=="")/*判断是否有空*/
		{
			dialog("请保证信息填写完整！");
		}else if(parseInt(apl_capacity)>parseInt(true_capacity))
		{
			dialog("容量超出，请选择合适的实验室！");

		}else if(apl_class_v==0){			/*判断申请班级是否选择*/
			dialog("请选择班级！");
		}
		else{
			console.log("error");
			$.ajax({
				url:  'asp/apply.asp',
				type: 'GET',
				data: {
					"week": apl_week,
					"day": apl_day,
					"lesson": apl_lesson,
					"capacity": apl_capacity,
					"cur_name": apl_cur_name,
					"exp_name": apl_exp_name,
					"reason": apl_reason,
					"class": apl_class,
					"address": apl_address,
					"th_id": th_id,
					"now": now,
				},
			})
			.done(function(data) {
				dialog(data);
			})
			.fail(function() {
				dialog("申请重复！(或已经有人申请了)。");
			});
		}
	return false;
	})

/*end 申请按钮绑定*/	


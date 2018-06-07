$(".center_th_name").click(function(){
	window.location.href="asp/teacher.asp";
});/*登录|个人中心按钮*/


	$("#ap_open").click(function(events){
		var ap_className=$("#ap_open i").attr("class");
		if(ap_className=="fa fa-chevron-left"){
			$("img.course_info").show();
			$("#ap_open i").removeClass().addClass("fa fa-times");
			events.stopPropagation();	
		}else{
			$("img.course_info").hide();
			$("#ap_open i").removeClass().addClass("fa fa-chevron-left");
			events.stopPropagation();	
		}
	})	

$(".content-shadow").click(function(events){
	aside_hide();
	events.stopPropagation();
})
$(".table td").click(function(){
	var _this=$(this);
	var chooseWeeks=$("#week-list option:selected").val();
	var nowWeeks=parseInt($(".msg-time-weeks").html());
	var contant=$(this).children().prop("class");
	if(contant!="bk_active"){
		dialog("本时间段不能预约!")
	}else if(chooseWeeks<nowWeeks){
		dialog("当前周次不能预约！");
	}
	else{


		var x=$(this).attr("value");			/*td的value值*/
		var y=$(this).parent().attr("value");	/*tr的value值*/

		var ap=getOptionInfo();				
		var ap_address_h=ap.address_h;		/*地址html值*/
		var ap_address_v=ap.address_v;		/*地址value值*/
		var ap_week_v=ap.week_v;			/*周次value值*/

		isChoose(ap_week_v,ap_address_v
			,function(){
				aside_data(ap_week_v,ap_address_h,x,y);
				_this.css("background","#444");
				var timer=setTimeout(function(){_this.css("background","#fff");}, 5000);	
			}
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
		var apl_cur_name=$("#ap_cur_name option:selected").html();		/*课程名称*/
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
				type: 'POST',
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

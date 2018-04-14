$(".center_th_name").click(function(){
	window.location.href="asp/teacher.asp";
});/*登录|个人中心按钮*/
/*$("#search").click(function(){
	var lab_type=$("#lab-type option:selected").html();

	var se=getOptionInfo();
	var se_address_h=se.address_h;
	var se_address_v=se.address_v;
	var se_week=se.week_v;

	console.table("lab_type:"+lab_type+"lab_address:"+se_address_h+"week_list:"+se_week);

	$.ajax("search2.asp?address="+se_address_h+"&week="+se_week)
	.done(function(data){
		console.log(data);
	})

	isChoose(se_week,se_address_v
	,function(){console.log("test");}
	,function(){dialog("请选择周次！")}
	,function(){dialog("请选择实验室！")});
});*/
$(".table td").not(".lesson").click(function(){
	/*$(this).html();*/

	var x=$(this).attr("value");			/*td的value值*/
	var y=$(this).parent().attr("value");	/*tr的value值*/

	var ap=getOptionInfo();				
	var ap_address_h=ap.address_h;		/*地址html值*/
	var ap_address_v=ap.address_v;		/*地址value值*/
	var ap_week_v=ap.week_v;			/*周次value值*/

	isChoose(ap_week_v,ap_address_v
		,function(){aside_data(ap_week_v,ap_address_v,x,y)}
		,function(){dialog("请选择周次！")}
		,function(){dialog("请选择实验室！")});
})

/*申请按钮绑定事件：传送数据给asp并向数据库插入数据*/
$("#apply").click(function(){
	getDate();/*申请日期*/
	console.log(now);

	
	$.ajax("search2.asp?now="+now)
	.done(function(data){
		console.log("finsh");
	})
	.fail(function(xhr,status,data) {
    console.log(xhr.status+","+status);
	})
})
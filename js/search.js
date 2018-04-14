window.onload=function(){

	getAddress();/*获取地址并调用createAddress进行创建*/
	$(".center_login").click(function(){
		window.location.href="asp/login.asp";
	});	

	/*search按钮*/
	$("#search").click(function(){
		var lab_type=$("#lab-type option:selected").html();
		var se=getOptionInfo();
		var se_address_h=se.address_h;
		var se_address_v=se.address_v;
		var se_week=se.week_v;

		console.table("lab_type:"+lab_type+"lab_address:"+se_address_h+"week_list:"+se_week);

		$.ajax("search2.asp?address="+se_address_h+"&week="+se_week)
		.done(function(data){
			console.log(data);
		})/*获取实验室占用情况数据*/

		isChoose(se_week,se_address_v
		,function(){console.log("test");}
		,function(){dialog("请选择周次！")}
		,function(){dialog("请选择实验室！")});

	});
}

/*----------------------------------------------------------------------*/
/*----------------------------------------------------------------------*/

	/*获取地址并调用createAddress进行创建*/
	function getAddress(){
		var labtype=document.getElementById("lab-type");
		var labtypeops=labtype.getElementsByTagName("option");
		for(var i=1;i<labtypeops.length;i++){
			(function(index){
				labtypeops[index].onclick=function(){
				$.ajax("search.asp?labtypeid="+index)
					.done(function(data){
							createAddress(data);
						})
					}
			})(i)
		}
	}
	/*创建实验室地址option*/
	function createAddress(text){
		var labad=document.getElementById("lab-address");
		var labops=labad.getElementsByTagName("option");
		if(text.length==0){
			console.log("none");
		}else{
			var arr=text.split(" ");
			labad.options.length=1;		//每次运行之前确保options只有一个。防止累加。
			for(var i=0;i<arr.length-1;i++){
				var op=document.createElement("option");
				op.innerHTML=arr[i];
				op.value=i+1;
				labad.append(op);
			}
		}
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
	/*获取option值*/
	function getOptionInfo(){
		return{
			address_h: $("#lab-address option:selected").html(),	/*地址html值*/
			address_v: $("#lab-address option:selected").val(),	/*地址value值*/
			week_v: $("#week-list option:selected").val(),	/*周次value值*/
		}
	}
	/*aside出现*/
	function aside_show(){
		$("aside#applypanel")
		.stop(true,false)
		.show()
		.animate({"right": 0,},600);
	}
	/*aside隐藏*/
	function aside_hide(){
		$("aside#applypanel")
		.stop(true,false)
		.animate(
			{"right": "-320px"},
			600,
			function(){
				$("aside#applypanel").hide();
			});	
	}
	/*提示框*/
	function dialog(massage){
		$(".dialog")
		.html(massage)
		.stop(true,false)
		.fadeIn("fast",function(){
			setTimeout(function(){
				$(".dialog")
				.stop(true,false)
				.fadeOut(100);
			}, 1000);	
		});
	}
	/*判断地址、周次是否选择*/
	function isChoose(week,address,fn1,fn2,fn3){
		if(week!=0&&address!=0)/*选过周次与地址*/
		{
			fn1();
		}
		else if(week==0&&address!=0)/*未选周次*/
		{
			fn2();
		}
		else/*未选地址*/
		{
			fn3();
		}
	}
	/*将选择的数据传输给aside*/
	function aside_data(week,address,x,y){
		aside_show();
		$("#ap_exit").click(function(){
			aside_hide();
		});
		/*aside中的数据*/
		$(".ap_week").html("第"+week+"周");
		$(".ap_address").html(address);
		$(".ap_day").html("星期"+x);
		$(".ap_lesson").html("第"+y+"节课");
	}
	/*x=td[value],y=tr[value]*/
	function searchGet(x,y,th_class,bk_reason,bk_by){
		$("tr[value="+y+"] td[value="+x+"]")
		.html("班级："+th_class+ "占用原因："+bk_reason+"预约人："+bk_by);
	}
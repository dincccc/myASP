$(function(){
	getAddress();/*获取地址并调用createAddress进行创建*/
	$(".center_login").click(function(){
		window.location.href="asp/login.asp";
	});	
	/*search按钮*/
	$("#week-list").change(function(){
		show_massage();
	})
	$("#search").click(function(){
		show_massage();
		return false;
	})
	function show_massage(){

		var se=getOptionInfo();
		var se_address_h=se.address_h;
		var se_address_v=se.address_v;
		var se_week=se.week_v;

		console.table("测试：查询按钮被点击");

		isChoose(se_week,se_address_v
		,function(){searchData(se_address_h,se_week);}
		,function(){dialog("请选择周次！")}
		,function(){dialog("请选择实验室！")});



		var msg_type_v=$("#lab-type option:selected").val();
		var msg_type_h=$("#lab-type option:selected").html();
		msgCheck(".msg-type",msg_type_v,msg_type_h);

		var msg_addr_v=$("#lab-address option:selected").val();
		var msg_addr_h=$("#lab-address option:selected").html();
		msgCheck(".msg-addr",msg_addr_v,msg_addr_h);

		var msg_week_v=$("#week-list option:selected").val();
		var msg_week_h="第"+msg_week_v+"周"
		msgCheck(".msg-week",msg_week_v,msg_week_h);
	}
	$(".table td").hover(function(){
		var _this=$(this);
		if(_this.html()==""){
			_this.html("<span class='bk_active'>点击预约</span>")/*children('.bk_active').css("display","block");*/
		}else{
			_this.children('.bk_active').css("display","block");
		}
	},function(){
		$(this).children('.bk_active').css("display","none");
	})

});

/*----------------------------------------------------------------------*/
/*----------------------------------------------------------------------*/

	/*获取地址并调用createAddress进行创建*/
	function getAddress(){
		$("#lab-type option").each(function(index){
			var _this=$(this);
			_this.click(function(){
				if(index==0){
					$("#lab-address option").not("[value=0]").remove();	
				}else
				{
					$.ajax("search.asp?labtypeid="+index)
					.done(function(data){
						var arr=eval("("+data+")");
						createAddress(arr,"lab-address")
					})
				}	
			})
		})	
	}
	/*创建实验室地址option*/
	function createAddress(arr,ID){
		var SECID=document.getElementById(ID);
		if(arr==""){
			console.log("none");
		}else{
			SECID.options.length=1;		//每次运行之前确保options只有一个。防止累加。
			for(var i=0;i<arr.length;i++){
				var op=document.createElement("option");
				for(var key in arr[i]){
					op.innerHTML=key;
					op.value=i+1;
					(function(i,key){
						op.onclick=function(){
							$(".ap_capacity").html(arr[i][key]);
						}	
					})(i,key)
				}
				SECID.append(op);	
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
		$(".side-left").stop(true,false).animate({"left": "-150px",},600);
		$(".content-shadow").stop(true,false).show().animate({"opacity": 1,},100);
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
			{"right": "-300px"},
			600,
			function(){
				$("aside#applypanel").hide();
			});
		$(".content-shadow").stop(true,true).animate({"opacity": 0,},100).hide();
		$(".side-left").stop(true,false).animate({"left": 0,},600);
	}
	/*提示框*/
	function dialog(massage){
		$(".dialog")
		.html(massage)
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
		$(".ap_day").attr("value",x);
		$(".ap_lesson").html("第"+y+"节课");
		$(".ap_lesson").attr("value",y);
		console.log("测试：aside_data");
	}
	/*x=td[value],y=tr[value]*/
	function searchGet(x,y,th_class,exp_name,bk_by){
		$("tr[value="+y+"] td[value="+x+"]")
		.html("班级："+th_class+"</br>"+ "占用原因："+exp_name+"</br>"+"预约人："+bk_by+"</br>");
	}
	/*获取数据并展示在table内*/
	function searchData(address_h,week){
		$(".table td").html("");/*清空上次查询*/
		$.ajax("search2.asp?address="+address_h+"&week="+week)
		.done(function(data){
			console.table("测试：数据已返回");
			if(data!=""){
				var record=eval("("+data+")");
				$.each(record,function(i,obj){
					console.table("测试：数据已解析");
					searchGet(obj.bk_day,obj.bk_lesson,obj.class,obj.exp_name,obj.th_name);
				})
			}else{
				console.log("没有预约信息");
			}
		})
	}
	/*msg-select判断方法*/
	function msgCheck(msg_class,msg_v,msg_h){
		if(msg_v==0){
			$(msg_class).html("-----");
		}else{	
			$(msg_class).html(msg_h);
		}
	}
﻿<%@Language="VBSCRIPT" CodePage="65001" %>
<%Response.Charset="utf-8"%>
<!DOCTYPE>
<html lang="zh-CN">
<head>
	<!--[if lt IE 9]>
        <h1>浏览器版本太低，您使用该系统将获得不好的体验！！</h1>
    <![endif]-->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>实验室预约界面</title>
	<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
	<link rel="stylesheet" href="css/first.css">
	<script src="js/jquery-3.2.1.js"></script>
	<script src="js/getWeeks.js"></script>
</head>
<body>
<!--#include file="conn.asp"-->
<nav class="navigation">
	<div class="logo-title">
		<h2>实验室预约系统</h2>
		<small>——计算机与信息学院</small>
	</div>
	<div class="login-register">	<!-- 登录按钮 -->
		<% 
		dim th_name,userid,am_name
		th_name=session("th_name") 
		userid=session("userid")
		am_name=session("admin_name")
		dim status
		if am_name="" and th_name<>"" then 
		response.write("<a class='center_th_name' title='个人中心'>"&th_name&"</a>")
		status="th" 
		else
		if th_name ="" and am_name<>"" then 
		response.write("<a class='center_am_name' title='后台管理'>"&am_name&"</a>") 
		status="am"
		else
		if th_name<>"" and am_name<>"" then 
		response.write("<script>alert('error!session未清除！')</script>")
		else 
		response.write("<a class='center_login' title='点击登录'>登录</a>") 
		status="login"
		end if
		end if
		end if
		%>
	</div>
</nav>
<section class="section-top">
	<select name="lab-type" id="lab-type" autocomplete="off">
		<option value="0" selected>请选择实验模块</option>
		<%
		dim sql_labtype
		sql_labtype="SELECT lab_type_id,lab_type_name FROM lab_type"
		set rsLabT=conn.execute(sql_labtype)
		if not(rsLabT.bof and rsLabT.eof) then
		arr=rsLabT.getrows
		dim recN:recN=UBound(arr,2)
			for i=0 to recN
		%>
			<option value=<%=arr(0,i)%>><%=arr(1,i)%></option>
		<%
			next
		else
		%>
			<option>无数据</option>
		<%
		end if
		%>
	</select>
	<select name="lab-address" id="lab-address" autocomplete="off">
		<option value="0" selected>请选择实验室</option>
	</select>
	<select name="week-list" id="week-list" autocomplete="off">
		<option value="0" selected>请选择周次</option>
		<% for i=1 to 20 %>
		<option value=<%=i%>>第<%=i%>周</option>
		<%next%>
	</select>
	<div class="lab_capacity"><span>容量：</span><span class="ap_capacity">--</span></div>
	<button class="search" id="search"><i class="fa fa-search"></i>&nbsp;查询</button>
</section>
<div class="msg-select">
	您当前选择的实验模块是:
	<span class="msg msg-type"></span>
	实验室为:
	<span class="msg msg-addr"></span>
	预约周次为:
	<span class="msg msg-week"></span>
	<div class="msg-time">当前周次：<sapn class="msg ">第<span class="msg-time-weeks"></span>周</sapn></div>
</div>
<div class="somelinks">
	其它功能：
	<a class="alink" href="asp/course-lab.asp" target="_blank">[当前各实验室支持课程]</a>|
	|<a class="alink" href="asp/code-name-tab.asp" target="_blank">[课程名称与代码对应表]</a>|
	|<a class="alink" href="asp/no-items.asp" target="_blank">[公告]</a>|
	|<a class="alink" href="asp/am-info.asp" target="_blank">[管理员联系方式]</a>
	<span class="now-time">日期：<span class="msg-time-all"></span></span>
</div>		
<section class="section-mid clearfix">
	<aside class="side-left">
		<div class="content-shadow"><img class="course_info" src="img/course_info.png" alt="实验支持课程对照表"><button class="ap_button" type="button" id="ap_open" title="打开/关闭对照表" ><i class="fa fa-chevron-left"></i></button>	</div>
		<table class="table">
			<tr><!-- 星期 -->
				<th></th>
				<th></th>
				<th>星期一</th>
				<th>星期二</th>
				<th>星期三</th>
				<th>星期四</th>
				<th>星期五</th>
				<th>星期六</th>
				<th>星期日</th>
			</tr>
			<!-- 课时 -->
			<% for i=1 to 13 %>
			<tr value=<%=i%>>
				<%if i=1 then%>
					<th rowspan="5">上午</th>
				<% else if i=6 then %>
					<th rowspan="4">下午</th>
				<% else if i=10 then %>
					<th rowspan="4">晚上</th>
				<%
				end if
				end if
				end if%>

				<th class="lesson">第<%=i%>节</th>
			<% for j=1 to 7 %>
				<td value=<%=j%>></td>
			<% next %>

			</tr>

			<% next %>
		</table>
	</aside>
<!--#include file="asp/aside.asp" -->
</section>
<!-- #include file="asp/footer.asp" -->

<div class="dialog"></div>
<script src="js/search.js"></script>
<%	if status="th" then %>
	<!-- #include file="asp/loginOutBtn.asp" --> <!-- 退出按钮 -->
	<script src='js/th_success.js'></script>
<% 	else if status="am" then %>
	<!-- #include file="asp/loginOutBtn.asp" --> <!-- 退出按钮 -->
	<script src='js/am_success.js'></script>
<%	else %>
	<script src='js/no_login.js'></script>
<%	
	end if
	end if
%>
</body>
</html>



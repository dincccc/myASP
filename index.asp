<%@Language="VBSCRIPT" CodePage="65001" %>
<%Response.Charset="utf-8"%>
<!DOCTYPE>
<html lang="zh-CN">
<head>
	<!--[if lt IE 9]>
        <h1>浏览器版本太低，您不配使用该系统！！</h1>
    <![endif]-->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>实验室预约界面</title>
	<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
	<link rel="stylesheet" href="css/first.css">
</head>
<body>
<!--#include file="conn.asp"-->
<nav class="navigation">
	<h2>实验室预约系统</h2>
	<div class="login-register">	<!-- 登录按钮 -->
	<% 
	th_name=session("th_name") 
	th_id=session("th_id")
	am_name=session("am_name")
	dim status

	if am_name="" and th_name<>"" then 
	response.write("<a class='center_th_name'>"&th_name&"</a>")
	status="th" 
	else
	if th_name ="" and am_name<>"" then 
	response.write("<a class='center_am_name'>"&am_name&"</a>") 
	status="am"
	else
	if th_name<>"" and am_name<>"" then 
	response.write("<script>alert('error!session未清除！')</script>")
	else 
	response.write("<a class='center_login'>登录</a>") 
	status="login"
	end if
	end if
	end if
	%>
	</div>
</nav>
<section class="section-top">
	<select name="lab-type" id="lab-type">
		<option value="0">请选择实验模块</option>
		<option value="1">硬件实验室</option>
		<option value="2">信息安全实验室</option>
		<option value="3">通信实验室</option>
		<option value="4">软件实验室</option>
		<option value="5">物联网实验室</option>
	</select>
	<select name="lab-address" id="lab-address">
		<option value="0">请选择实验室</option>
	</select>
		<select name="week-list" id="week-list">
		<option value="0">请选择周次</option>
<%
for i=1 to 20
response.write("<option value='"&i&"'>第"&i&"周</option>")
next
%>
	</select>
	<button class="search" id="search"><i class="fa fa-search"></i>&nbsp;查询</button>
</section>
<table class="table">
	<tr><!-- 星期 -->
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
<%
for i=1 to 13
response.write("<tr value="&i&"><td class='lesson'>第"&i&"节</td><td value='1'></td><td value='2'></td><td value='3'></td><td value='4'></td><td value='5'></td><td value='6'></td><td value='7'></td></tr>")
next
%>
</table>
<footer><!-- 页脚 -->
	<span>@Lorem ipsum dolor sit amet, consectetur adipisicing elit.</span>
</footer>

<aside id="applypanel"><!-- 预约信息面板 -->
	<h1>预约申请</h1>
	<div class="apply-box">
		<div><span>周次：</span><span class="ap_week"></span></div>
		<div><span>星期：</span><span class="ap_day"></span></div>
		<div><span>课时：</span><span class="ap_lesson"></span></div>
		<div><span>实验室：</span><span class="ap_address"></span></div>
		<div><span>实验室容量：</span><span class="ap_capacity"></span></div>
		<div><span>人数：</span><input type="text" id="ap_students"></div>
		<div><span>申请原因：</span><input type="text" id="ap_reason"></div>
		<span>申请人:<%=th_name%></span>
		<span>申请日期：<%=now()%></span>
		<button type="button" id="apply">申请</button>
		<button type="button" id="ap_exit">退出</button>
	</div>
</aside>
<div class="dialog"></div>
<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
<script src="js/search.js"></script>
<%
if status="th" then
response.write("<script src='js/th_success.js'></script>")
else if status="am" then 
response.write("<script src='js/am_success.js'></script>")
else
response.write("<script src='js/no_login.js'></script>")
end if
end if
%>
</body>
</html>



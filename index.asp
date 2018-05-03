<%@Language="VBSCRIPT" CodePage="65001" %>
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
</head>
<body>
<!--#include file="conn.asp"-->
<nav class="navigation">
	<h2>实验室预约系统</h2>
	<div class="login-register">	<!-- 登录按钮 -->
	<% 
	dim th_name,userid,am_name
	th_name=session("th_name") 
	userid=session("userid")
	am_name=session("admin_name")
	dim status
	response.write("<script>console.log('"&th_name&"H"&userid&"H"&am_name&"');</script>")
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
	<select name="lab-type" id="lab-type" autocomplete="off">
		<option value="0" selected>请选择实验模块</option>
		<option value="1">硬件实验室</option>
		<option value="2">信息安全实验室</option>
		<option value="3">通信实验室</option>
		<option value="4">软件实验室</option>
		<option value="5">物联网实验室</option>
	</select>
	<select name="lab-address" id="lab-address" autocomplete="off">
		<option value="0" selected>请选择实验室</option>
	</select>
		<select name="week-list" id="week-list" autocomplete="off">
		<option value="0" selected>请选择周次</option>
<%
for i=1 to 20
response.write("<option value='"&i&"'>第"&i&"周</option>")
next
%>
	</select>
	<div class="lab_capacity"><span>容量：</span><span class="ap_capacity"></span></div>
	<button class="search" id="search"><i class="fa fa-search"></i>&nbsp;查询</button>
</section>
<div class="msg-select">
	您当前选择的实验模块是:
	<span class="msg msg-type"></span>
	实验室为:
	<span class="msg msg-addr"></span>
	实验周次为:
	<span class="msg msg-week"></span>
</div>
<section class="section-mid">
	<aside class="side-left">
		<div class="content-shadow"></div>
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
		<% for i=1 to 13 %>
		<tr value=<%=i%>>
			<th class='lesson'>第<%=i%>节</th>

		<% for j=1 to 7 %>
			<td value=<%=j%>></td>
		<% next %>

		</tr>

		<% next %>

		</table>
</aside>
<!--#include file="asp/aside.asp" -->
</section>
<!-- <footer>页脚
	<span>@Lorem ipsum dolor sit amet, consectetur adipisicing elit.</span>
</footer> -->
<div class="dialog"></div>

<script src="js/jquery-3.2.1.js"></script>
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



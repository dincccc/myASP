<%Response.Charset="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Course</title>
<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
<script src="../js/jquery-3.2.1.js"></script>
<style>
table.table{
	margin: 40px auto;
	width: 64%;
	text-align: center;
	font-size: 16px;
}
body{
background:url("../img/bg.png") ;
	
}
table.table tr td{
	color: #fff;
}
</style>
</head>
<!-- #include file="conn.asp" -->
<table class="table table-bordered">
<thead class="thead-light">
  <tr>
    <th colspan="5">当前各实验室支持课程</th>
  </tr>
  <tr>
    <th>硬件实验室(HW)</th>
    <th>信息安全实验室(IS)</th>
    <th>通信实验室(CC)</th>
    <th>软件实验室(SW)</th>
    <th>物联网实验室(IOT)</th>
  </tr>
</thead>
<tbody>
<% for j=1 to 6  %>
<tr value=<%=j%>>
<%
	dim arrCode:arrCode=Array("HW","IS","CC","SW","IOT")
	for i=0 to 4
	dim sqlY
		if j=1 then
			sqlY=1
		else
			sqlY=j-1&",1"
		end if
	dim sqlX:sqlX="SELECT c_name FROM course_info WHERE c_code LIKE '"&arrCode(i)&"%' LIMIT "&sqlY
	set rs=conn.execute(sqlX)
	if not(rs.bof and rs.eof) then
	%>
	<td><%=rs("c_name")%></td>
	<%
	else
	%>
	<td>---</td>
<%
	end if
	next 
%>
</tr>
<% next %>
</tbody>
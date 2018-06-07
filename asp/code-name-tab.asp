<%Response.Charset="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>code_name</title>
<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
<script src="../js/jquery-3.2.1.js"></script>
<style>
table.table{
	margin: 40px auto;
	width: 25%;
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
    <th colspan="2">课程代码与名称对照表</th>
  </tr>
  <tr>
    <th>课程代码</th>
    <th>课程名称</th>
  </tr>
</thead>
<tbody>

<%
	dim sqlX:sqlX="SELECT c_code,c_name FROM course_info"
	set rs=conn.execute(sqlX)
	do until rs.eof
%><tr>
	<td><%=rs("c_code")%></td>
	<td><%=rs("c_name")%></td>
	</tr>
<%
	rs.MoveNext
	loop
%>

</tbody>
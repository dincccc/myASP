<%Response.Charset="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>管理员信息</title>
<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
<script src="../js/jquery-3.2.1.js"></script>
<style>
body{
background:url("../img/bg.png") ;
	
}
table.table{
	margin: 40px auto;
	width: 25%;
	text-align: center;
	font-size: 16px;
}
table.table tr td{
	color: #fff;
}
</style>
</head>
<!-- #include file="conn.asp" -->
<table class="table table-bordered table-hover">
<thead class="thead-light">
  <tr>
    <th colspan="3">管理员信息表</th>
  </tr>
  <tr>
    <th>管理员ID</th>
    <th>管理员</th>
    <th>管理员联系方式</th>
  </tr>
</thead>
<tbody>

<%
	dim sqlX:sqlX="SELECT * FROM admin_info"
	set rs=conn.execute(sqlX)
	do until rs.eof
%><tr>
	<td><%=rs("admin_id")%></td>
	<td><%=rs("admin_name")%></td>
	<td><%=rs("admin_phone")%></td>
	</tr>
<%
	rs.MoveNext
	loop
%>

</tbody>
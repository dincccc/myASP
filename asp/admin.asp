<%Response.Charset="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>管理员界面</title>
<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="../css/admin.css">

</head>
<body>

<!-- #include file="conn.asp"-->
<div class="add_operate">
	<div class="add add_lab">ADD LAB:click ==> INSERT INTO lab_info VALUE lab_address,lab_capacity,lab_type_id</div>
	<div class="add add_th">ADD TH:click ==> INSERT INTO th_info VALUE th_name,th_id</div>
	<div class="add check_record">CHECK RECORD:click==> change bk_re_status to 1 or 2</div>
</div>


<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
<script src='../js/admin.js' type='text/javascript'></script>
</body>
</html>
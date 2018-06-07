<%Response.Charset="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人中心</title>
<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="../css/teacher.css">
<script src="../js/jquery-3.2.1.js"></script>
<script src="../js/validate.js" type="text/javascript"></script>
</head>
<body>
<header>
	<h2>教师个人中心</h2>
	<div class="booking-exit">返回预约 <i class="fa fa-sign-out"></i></div>
</header>
<!-- #include file="conn.asp"-->
<%
	name=session("th_name")
	id=session("userid")

	if id<>"" then

	sql_info="SELECT a.th_sex,a.th_phone,a.th_mail,b.th_class FROM teacher_info AS a LEFT JOIN teacher_class AS b ON a.th_id=b.th_id WHERE a.th_id="&id&" and b.th_id="&id
	set rs=conn.execute(sql_info)

	if rs("th_sex")=0 then
	sex="男"
	else
	sex="女"
	end if

	th_phone=rs("th_phone")
	th_mail=rs("th_mail")
	th_class=rs("th_class")

	else 
	id=""
	name=""
	sex=""
	th_phone=""
	th_mail=""
	th_class=""
	Response.Write("<script>alert('请登录后使用，谢谢！');window.location.href='login.asp';</script>")
	rs.close
	conn.close
	set rs=nothing
	set conn=nothing
	end if
%>
<!-- <h1>教师个人中心</h1> -->
<div class="container clearfix">
	<div class="box-info">
		<span class="info-title">个人信息:</span>
		<div class="info-table">
			<p><span>账号：</span><span id="info-id"><%=id%></span></p>
			<p><span>姓名：</span><span><%=name%></span></p>
			<p><span>性别：</span><span><%=sex%></span></p>
			<p><span>班级：</span><span><%=th_class%></span></p>
			<p><span>号码：</span><span class="phone"><%=th_phone%></span></p>
			<p><span>邮箱：</span><span class="mail"><%=th_mail%></span></p>
		</div>
		<ul class="control-g">
			<li><a class="keep-pwd" href="javascript:;">修改密码</a></li>
			<li><a class="change-info" href="javascript:;">修改信息</a></li>
		</ul>
		<div class="pwd-change clearfix">
			<div class="pc-box">
				<div class="pwd-old"><label for="pwd-old">请输入旧密码:</label><input id="pwd-old" type="password"></div>
				<div class="pwd-new"><label for="pwd-new">请输入新密码:</label><input id="pwd-new" type="password"></div>
				<div class="pwd-confirm"><label for="pwd-confirm">确认密码:</label><input id="pwd-confirm" type="password"></div>
			</div>
			<a class="confirm confirmChPwd" href="javascript:;">确认</a>
		</div>
		<div class="info-change clearfix">
			<div class="pc-box">
				<div class="phone-new"><label for="phone-new">新号码:</label><input id="phone-new" type="text"></div>
				<div class="mail-new"><label for="mail-new">新邮箱:</label><input id="mail-new" type="text"></div>
			</div>
			<a class="confirm confirmChInfo" href="javascript:;">提交</a>
		</div>		
	</div>
	<div class="box-booking">
		<table class="booking-record">
		<thead>
			<tr><th colspan="11" class="tb_title">预约记录</th></tr>
			<tr>
				<th>序号</th>
				<th>周次</th>
				<th>星期</th>
				<th>课次</th>
				<th>教室</th>
				<th>预约班级</th>
				<th>实验名称</th>
				<th>预约状态</th>
				<th>预约时间</th>
				<th>撤销</th>
				<th>删除</th>
			</tr>
		</thead>
		<tbody class="th-booking-record">
			<!-- #include file="pageRecord.asp" -->
		</tbody>
		</table>
	</div>	
</div>
<!-- #include file="footer.asp" -->		<!-- 页脚 -->
<!-- #include file="loginOutBtn.asp" --> <!-- 退出按钮 -->
<div class="dialog"></div>
<script src="../js/teacher.js" type="text/javascript"></script>
</body>
</html>
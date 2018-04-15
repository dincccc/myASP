<%Response.Charset="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人中心</title>
<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="../css/teacher.css">

</head>
<body>

<!-- #include file="conn.asp"-->
<%
name=session("th_name")
id=session("th_id")

if id<>"" then

sql_info="SELECT th_sex,th_phone,th_mail FROM teacher_info WHERE th_id="&id
set rs=conn.execute(sql_info)

if rs("th_sex")=0 then
sex="男"
else
sex="女"
end if

th_phone=rs("th_phone")
th_mail=rs("th_mail")

else 
id=""
name=""
sex=""
th_phone=""
th_mail=""
Response.Write("<script>alert('请登录后使用，谢谢！');window.location.href='login.asp';</script>")
end if
%>
<!-- <h1>教师个人中心</h1> -->
<div class="container">
	<div class="box-info">
		<span class="info-title">个人信息:</span>
		<div class="info-table">
			<p><span>账号：</span><span><%=id%></span></p>
			<p><span>姓名：</span><span><%=name%></span></p>
			<p><span>性别：</span><span><%=sex%></span></p>
			<p><span>号码：</span><span class="phone"><%=th_phone%></span></p>
			<p><span>邮箱：</span><span class="mail"><%=th_mail%></span></p>
		</div>
		<ul class="control-g">
			<li><a class="keep-pwd" href="javascript:;">修改密码</a></li>
			<li><a class="change-info" href="javascript:;">修改信息</a></li>
			<li><a class="save" href="javascript:;">保存</a></li>
		</ul>
		<div class="pwd-change clearfix">
			<div class="pc-box">
				<div class="pwd-old"><label for="pwd-old">请输入旧密码:</label><input id="pwd-old" type="password"></div>
				<div class="pwd-new"><label for="pwd-new">请输入新密码:</label><input id="pwd-new" type="password"></div>
				<div class="pwd-confirm"><label for="pwd-confirm">确认密码:</label><input id="pwd-confirm" type="password"></div>
			</div>
			<a class="confirm-ch" href="javascript:;">确认</a>
		</div>
		<div class="info-change clearfix">
			<div class="pc-box">
				<div class="phone-new"><label for="phone-new">新号码:</label><input id="phone-new" type="text"></div>
				<div class="mail-new"><label for="mail-new">新邮箱:</label><input id="mail-new" type="email"></div>
			</div>
			<a class="confirm-ch" href="javascript:;">确认</a>
		</div>		
		
	</div>
	<div class="box-booking">
		<table class="booking-record">
			<tr><th colspan="10" class="tb_title">预约记录</th></tr>
			<tr>
				<th>序号</th>
				<th>周次</th>
				<th>星期</th>
				<th>课次</th>
				<th>教室</th>
				<th>预约原因</th>
				<th>预约状态</th>
				<th>预约时间</th>
				<th>撤销</th>
				<th>删除</th>
			</tr>
<%
sql_record="SELECT bk_re_id,bk_re_status,bk_week,bk_day,bk_lesson,bk_reason,lab_address,bk_date FROM booking_record WHERE th_id="&id
set re=conn.execute(sql_record)
do until re.eof
  	num=re.Fields(0).value
	bk_re_status=re.Fields(1).value
	week=re.Fields(2).value
	d_day=re.Fields(3).value
	lesson=re.Fields(4).value
	reason=re.Fields(5).value
	lab_address=re.Fields(6).value

	if bk_re_status=0 then
	status="审核中.."
	else if bk_re_status=1 then
	status="通过"
	else
	status="未通过"
	end if
	end if

	b_time=re.Fields(7).value

	'set rl=conn.execute("SELECT lab_address FROM lab_info WHERE lab_id="&lab_id)
	'lab=rl("lab_address")

  	Response.Write("<tr><td>"&num&"</td><td>"&week&"</td><td>"&d_day&"</td><td>"&lesson&"</td><td>"&lab_address&"</td><td>"&reason&"</td><td class='status'>"&status&"</td><td>"&b_time&"</td><td><i class='fa fa-reply reply'></i></td><td><i class='fa fa-minus-circle delete'></i></td></tr>")
  re.MoveNext
loop
%>	
		<tr><td colspan="10"><span>.......</span></td></tr>
		</table>
		<div class="booking-exit">返回预约 <i class="fa fa-sign-out"></i></div>
	</div>
	
</div>
<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
<script src='../js/teacher.js' type='text/javascript'></script>
</body>
</html>
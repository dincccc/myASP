<!-- #include file="conn.asp"-->
<!-- #include file="sendMail.asp" -->
<%
c_week=request.Form("week")
c_day=request.Form("day")
c_lesson=request.Form("lesson")
c_lab_address=request.Form("lab-address")
check_by=request.Form("check-by")
check_date=request.Form("now")
isfrom=request.Form("isfrom")
iswhat=request.Form("iswhat")
th_id=request.Form("th-id")



'更新预约信息
if isfrom="th" then
	if iswhat="del" then
	dim sqlThD:sqlThD="UPDATE booking_record SET isdel='1' WHERE bk_week='"&c_week&"' and bk_day='"&c_day&"' and bk_lesson='"&c_lesson&"' and lab_address='"&c_lab_address&"'"
	call isReplyDel(sqlThD)
	else 
	dim sqlThR:sqlThR="DELETE FROM booking_record WHERE bk_week='"&c_week&"' and bk_day='"&c_day&"' and bk_lesson='"&c_lesson&"' and lab_address='"&c_lab_address&"'"
	call isReplyDel(sqlThR)
	end if 
else
	'发送邮件
	dim sql_msg,th_name,Email
	sql_msg="SELECT th_name,th_mail FROM teacher_info WHERE th_id="&th_id
	set rsMsg=conn.execute(sql_msg)
	th_name=rsMsg("th_name")
	Email=rsMsg("th_mail")
	mailTitle="实验室预约结果"
	mailContent=th_name&"老师：您预约的第"&c_week&"周,星期"&c_day&",第"&c_lesson&"节课的实验室"&c_lab_address
	mailContentP="预约成功！</br>"&mailContent&",预约成功了！若有疑问请联系管理员！"
	mailContentJ="预约失败！</br>"&mailContent&",预约失败了！请选择合适教室重新预约，若有疑问请联系管理员！"
	if isfrom="amp"then
		call ischeck(c_week,c_day,c_lesson,c_lab_address,1,check_by,check_date)
		call sendMail(Email,mailTitle,mailContentP)
	else
		call ischeck(c_week,c_day,c_lesson,c_lab_address,2,check_by,check_date)
		call sendMail(Email,mailTitle,mailContentJ)
	end if
end if

function ischeck(c_week,c_day,c_lesson,c_lab_address,bk_re_status,check_by,check_date)
	dim sql,condition
	condition="bk_week='"&c_week&"' and bk_day='"&c_day&"'and bk_lesson='"&c_lesson&"' and lab_address='"&c_lab_address&"'"
	sql="UPDATE booking_record SET ischeck='1',bk_re_status='"&bk_re_status&"',check_by='"&check_by&"',check_date='"&check_date&"' WHERE "&condition
	set rs=conn.execute(sql)
end function

function isReplyDel(sql)
	set rs=conn.execute(sql)
end function
%>

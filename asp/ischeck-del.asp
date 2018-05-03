<!-- #include file="conn.asp"-->
<%
c_week=request.QueryString("week")
c_day=request.QueryString("day")
c_lesson=request.QueryString("lesson")
c_lab_address=request.QueryString("lab-address")
check_by=request.QueryString("check-by")
check_date=request.QueryString("now")
isfrom=request.QueryString("isfrom")

if isfrom="amp "then
	call ischeckP(c_week,c_day,c_lesson,c_lab_address,check_by,check_date)
else if isfrom="th" then
	call isdel(c_week,c_day,c_lesson,c_lab_address)
else
	call ischeckJ(c_week,c_day,c_lesson,c_lab_address,check_by,check_date)
end if
end if

function ischeckP(c_week,c_day,c_lesson,c_lab_address,check_by,check_date)
	dim sql,sql2,sql3,condition,condition1
	condition="bk_week,bk_day,bk_lesson,exp_name,lab_address,th_id"
	condition1="bk_week='"&c_week&"' and bk_day='"&c_day&"'and bk_lesson='"&c_lesson&"' and lab_address='"&c_lab_address&"'"
	sql="UPDATE booking_record SET ischeck='1',bk_re_status='1' WHERE "&condition1

	sql2="INSERT INTO `booking_info` (`bk_week`,`bk_day`,`bk_lesson`,`exp_name`,`lab_address`,`th_id`,`check_by`,`check_date`)"
    sql3="SELECT "&condition&",'"&check_by&"','"&check_date&"' FROM booking_record WHERE bk_re_status='1' and "&condition1
	'通过的插入booking_info中

	set rs1=conn.execute(sql)
	set rs=conn.execute(sql2&sql3)
end function

function ischeckJ(c_week,c_day,c_lesson,c_lab_address,check_by,check_date)
	dim sql,condition1
	condition1="bk_week='"&c_week&"' and bk_day='"&c_day&"'and bk_lesson='"&c_lesson&"' and lab_address='"&c_lab_address&"'"
	sql="UPDATE booking_record SET ischeck='1',bk_re_status='2' WHERE "&condition1
	set rs=conn.execute(sql)
end function

function isdel(c_week,c_day,c_lesson,c_lab_address)
	dim sql
	sql="UPDATE booking_record SET isdel='1' WHERE bk_week='"&c_week&"' and bk_day='"&c_day&"' and bk_lesson='"&c_lesson&"' and lab_address='"&c_lab_address&"'"
	set rs=conn.execute(sql)
	response.write("删除成功！")
end function
%>
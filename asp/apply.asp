<%Response.Charset="utf-8"%>
<!-- #include file="conn.asp"-->
<%
'插入booking_record数据
ap_week=request.QueryString("week")
ap_day=request.QueryString("day")
ap_lesson=request.QueryString("lesson")
ap_capacity=request.QueryString("capacity")
ap_address=request.QueryString("address")
ap_reason=request.QueryString("reason")
th_id=request.QueryString("th_id")
ap_now=request.QueryString("now")
' 查重ap_week ap_day ap_lesson
sql="SELECT * FROM booking_record WHERE bk_week='"&ap_week&"' and bk_day='"&ap_day&"' and bk_lesson='"&ap_lesson&"'"
set rs1=conn.execute(sql)
if rs1.eof then
	sql1="INSERT INTO `booking_record` (`bk_week`,`bk_day`,`bk_lesson`,`bk_reason`,`lab_address`,`th_id`,`bk_date`) " 
	sql2="VALUES ('"&ap_week&"','"&ap_day&"','"&ap_lesson&"','"&ap_reason&"','"&ap_address&"','"&th_id&"','"&ap_now&"')"
	set rs2=conn.execute(sql1&sql2)
	Response.write("申请发出，请等待审核")
else 
Response.write("申请重复！")
end if
%>
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

sql="INSERT INTO `booking_record` (`bk_week`,`bk_day`,`bk_lesson`,`bk_reason`,`lab_address`,`th_id`,`bk_date`) "  '多个数据'
sql2="VALUES ('"&ap_week&"','"&ap_day&"','"&ap_lesson&"','"&ap_reason&"','"&ap_address&"','"&th_id&"','"&ap_now&"')"
set rs=conn.execute(sql&sql2)
%>
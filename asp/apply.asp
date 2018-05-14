<%Response.Charset="utf-8"%>
<!-- #include file="conn.asp"-->
<%
'插入booking_record数据
ap_week=request.Form("week")
ap_day=request.Form("day")
ap_lesson=request.Form("lesson")
ap_capacity=request.Form("capacity")
ap_address=request.Form("address")
ap_cur_name=request.Form("cur_name")
ap_exp_name=request.Form("exp_name")
ap_reason=request.Form("reason")
ap_class=request.Form("class")
th_id=request.Form("th_id")
ap_now=request.Form("now")
' 查重ap_week ap_day ap_lesson
'sql="SELECT * FROM booking_record WHERE bk_week='"&ap_week&"' and bk_day='"&ap_day&"' and bk_lesson='"&ap_lesson&"'"
'set rs1=conn.execute(sql)
'if rs1.eof then
sql1="INSERT INTO `booking_record` (`bk_week`,`bk_day`,`bk_lesson`,`cur_name`,`exp_name`,`bk_note`,`class`,`lab_address`,`th_id`,`bk_date`) " 
sql2="VALUES ('"&ap_week&"','"&ap_day&"','"&ap_lesson&"','"&ap_cur_name&"','"&ap_exp_name&"','"&ap_reason&"','"&ap_class&"','"&ap_address&"','"&th_id&"','"&ap_now&"')"
set rs=conn.execute(sql1&sql2)
Response.write("申请发出，请等待审核")
' rs.close
' conn.close
' set rs=nothing
' set conn=nothing
'else 
'Response.write("申请重复！（或已经有人申请了。）")
'end if
%>
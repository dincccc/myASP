<%Response.Charset="utf-8"%>
<!-- #include file="conn.asp"-->
<%
' 查询booking_record数据
address=request.QueryString("address")
week=request.QueryString("week")
sql1="SELECT bk_day,bk_lesson,class,bk_reason,th_name FROM teacher_info AS A,booking_record AS B WHERE A.th_id=B.th_id "
sql2="and bk_re_status='1' and lab_address='"&address&"' and bk_week='"&week&"'"
set rs2=conn.execute(sql1&sql2)
if not(rs2.bof and rs2.eof) then
	arr=rs2.getrows()
	recN=UBound(arr,2)
	Response.write("[")
	for j=0 to recN
		Response.write("{")
		for i=0 to rs2.fields.count-1
			response.write("'"&rs2.fields(i).name&"' : '"&arr(i,j)&"',")
		next
		Response.write("},")
	next
	Response.write("]")
end if
' if not(rs2.bof and rs2.eof) then
' arr2=rs2.getrows
' for each i in arr2
' Response.write(i&"|")	
' next
' else 
' Response.write("search nothing！")
' end if
%>
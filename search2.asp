<%Response.Charset="utf-8"%>
<!-- #include file="conn.asp"-->
<%
' 查询booking_record数据
address=request.QueryString("address")
week=request.QueryString("week")
sql1="SELECT bk_day,bk_lesson,class,bk_reason,th_name FROM teacher_info AS A,booking_record AS B WHERE A.th_id=B.th_id "
sql2="and bk_re_status='1' and lab_address='"&address&"' and bk_week='"&week&"'"
set rs=conn.execute(sql1&sql2)
if not(rs.bof and rs.eof) then
	arr=rs.getrows()
	recN=UBound(arr,2)
	Response.write("[")
	for j=0 to recN
		Response.write("{")
		for i=0 to rs.fields.count-1
			response.write("'"&rs.fields(i).name&"' : '"&arr(i,j)&"',")
		next
		Response.write("},")
	next
	Response.write("]")
end if
rs.close
conn.close
set rs=nothing
set conn=nothing
' if not(rs.bof and rs.eof) then
' arr2=rs.getrows
' for each i in arr2
' Response.write(i&"|")	
' next
' else 
' Response.write("search nothing！")
' end if
%>
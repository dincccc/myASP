<%Response.Charset="utf-8"%>
<!-- #include file="conn.asp"-->
<%
' 查询booking_record数据
address=request.QueryString("address")
week=request.QueryString("week")
sql2="SELECT bk_day,bk_lesson,class,bk_reason,th_id FROM booking_record WHERE lab_address='"&address&"' and bk_week='"&week&"'"
set rs2=conn.execute(sql2)
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
' if not(rs2.bof and rs2.eof) then
' arr2=rs2.getrows
' for each i in arr2
' Response.write(i&"|")	
' next
' else 
' Response.write("search nothing！")
' end if


' 插入booking_record数据
' ap_now=request.QueryString("now")
' sql="INSERT INTO `booking_record` (`date`) VALUES ('"&ap_now&"')"  '多个数据'
' Response.write("ap_now")
' set rs=conn.execute(sql)
%>
<%Response.Charset="utf-8"%>
<!-- #include file="conn.asp"-->
<%
' 查询booking_record数据
address=request.QueryString("address")
week=request.QueryString("week")
sql2="SELECT * FROM booking_record WHERE lab_address='"&address&"' and bk_week='"&week&"'"
set rs2=conn.execute(sql2)
if not(rs2.bof and rs2.eof) then
arr2=rs2.getrows
for each i in arr2
Response.write(i&"|")	
next
else 
Response.write("search nothing！")
end if


' 插入booking_record数据
ap_now=request.QueryString("now")
sql="INSERT INTO `booking_record` (`date`) VALUES ('"&ap_now&"')"  '多个数据'
Response.write("ap_now")
set rs=conn.execute(sql)
%>
<%Response.Charset="utf-8"%>
<!-- #include file="conn.asp"-->
<%
labid=request("labtypeid")
sql="SELECT lab_address FROM lab_info GROUP BY lab_type_id,lab_address HAVING lab_type_id='"&labid&"'"
set rs=conn.execute(sql)
if not(rs.bof and rs.eof) then
arr=rs.getrows
for each i in arr
Response.write(i&" ")	
next
else
Response.write("教室查询不存在！")
end if
%>


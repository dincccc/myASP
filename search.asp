<%Response.Charset="utf-8"%>
<!-- #include file="conn.asp"-->
<%
'教室地址option数据
labid=request("labtypeid")
sql="SELECT lab_address,lab_capacity FROM lab_info GROUP BY lab_type_id,lab_address,lab_capacity  HAVING lab_type_id='"&labid&"'"
set rs=conn.execute(sql)
if not(rs.bof and rs.eof) then
arr=rs.getrows()
recN=UBound(arr,2)
Response.write("[")	
for i=0 to recN
Response.write("{'"&arr(0,i)&"' : '"&arr(1,i)&"'},")	
next
Response.write("]")	
else
Response.write("教室查询不存在！")
end if
%>


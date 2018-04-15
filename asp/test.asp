<%Response.Charset="utf-8"%>
<!-- #include file="conn.asp"-->
<!-- #include file="MD5.asp"-->
<%
set rs=conn.Execute("SELECT admin_name,admin_pwd FROM admin_info WHERE admin_id='10002'")
if rs.eof then			'查不到记录，姓名不存在'
	response.write(1)
else if rs("admin_pwd")="666666"then
	response.write(2)
else
	response.write(MD5("sos12138007",16))
end if
end if

rs.close
conn.close
set rs=nothing
set conn=nothing
%>


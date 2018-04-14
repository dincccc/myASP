
<%Response.Charset="utf-8"%>
<!-- #include file="conn.asp"-->
<%
username=request("user")
password=request("pwd")
set rs=conn.Execute("SELECT admin_name,admin_pwd FROM admininfo WHERE admin_name='"&username&"'")
if rs.eof then			'查不到记录，姓名不存在'
	response.write("1")
else if rs("admin_pwd")<>password  then
	response.write("2")
else
	response.write("3")
end if
end if
rs.close
conn.close
set rs=nothing
set conn=nothing
%>


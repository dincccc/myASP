<%Response.Charset="utf-8"%>
<!-- #include file="conn.asp"-->
<!-- #include file="MD5.asp"-->
<%
userid=request.QueryString("id")
password=request.QueryString("pass")
remember=request.QueryString("remember")
set rs=conn.Execute("SELECT admin_name,admin_pwd FROM admin_info WHERE admin_id='"&userid&"'")
if rs.eof then			'查不到记录，姓名不存在'
	response.write(1)
else if rs("admin_pwd")<>MD5(password,16) then
	response.write(2)
else
	response.write(3)
	if remember="1" then
		response.cookies("am_id")=userid
		response.cookies("am_id").expires=DateAdd("d",1,now())
		response.cookies("am_pwd")=password
		response.cookies("am_pwd").expires=DateAdd("d",1,now())
	end if
	if session.contents.count <>0 then
		session.contents.removeall()
	end if
	session("am_id")=userid
	session("am_name")=rs("admin_name")
	session("am_pwd")=rs("admin_pwd")
end if
end if
rs.close
conn.close
set rs=nothing
set conn=nothing
%>


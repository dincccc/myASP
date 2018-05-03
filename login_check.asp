
<!--#include file="conn.asp"-->
<%
login_pass=request("user")
login_id=request("pwd")
rbme=request.form("Remember_me")
login_id_other=request.cookies("userid")
login_pass_other=request.cookies("password")
if login_id<>"" and login_pass<>"" then
	call login_check(login_id,login_pass)
if rbme<>"" then
	response.cookies("userid")=login_id
	response.cookies("userid").expires=DateAdd("d",1,now())
	response.cookies("password")=login_pass
	response.cookies("password").expires=DateAdd("d",1,now())
end if
else 
if login_id=""and login_pass=""and login_id_other<>""and login_pass_other<>"" then
login_id=login_id_other
login_pass=login_pass_other
call login_check(login_id,login_pass)
else
response.write("请输入完整信息")
response.end()
end if
end if
sub login_check(login_id,login_pass)
set rs=conn.Execute("SELECT admin_id,admin_pwd FROM admininfo WHERE admin_id='"&login_id&"'")
if rs.eof then
	response.write("1")
else
if rs("admin_pwd")<>login_pass then
	response.write("2")
else
	response.write("3")
end if
end if
end sub
%>


<!--#include file="conn.asp"-->
<%
login_pass=request("user")
login_name=request("pwd")
rbme=request.form("Remember_me")
login_name_other=request.cookies("username")
login_pass_other=request.cookies("password")
if login_name<>"" and login_pass<>"" then
	call login_check(login_name,login_pass)
if rbme<>"" then
	response.cookies("username")=login_name
	response.cookies("username").expires=DateAdd("d",1,now())
	response.cookies("password")=login_pass
	response.cookies("password").expires=DateAdd("d",1,now())
end if
else 
if login_name=""and login_pass=""and login_name_other<>""and login_pass_other<>"" then
login_name=login_name_other
login_pass=login_pass_other
call login_check(login_name,login_pass)
else
response.write("请输入完整信息")
response.end()
end if
end if
sub login_check(login_name,login_pass)
set rs=conn.Execute("SELECT admin_name,admin_pwd FROM admininfo WHERE admin_name='"&login_name&"'")
if rs.eof then
	response.write("请检查名称是否输入正确")
else
if rs("admin_pwd")<>login_pass then
	response.write("请检查密码是否输入正确")
else
	response.write("<script>window.location.href='index.asp'</script>")
end if
end if
end sub
%>

<%Response.Charset="utf-8"%>
<!-- #include file="conn.asp"-->
<!-- #include file="MD5.asp"-->
<%
userid=request.QueryString("id")
password=request.QueryString("pass")
remember=request.QueryString("remember")
set rs=conn.Execute("SELECT th_name,th_pwd FROM teacher_info WHERE th_id='"&userid&"'")
if rs.eof then			'查不到记录，姓名不存在'
	response.write(1)
else if rs("th_pwd")<>MD5(password,16)  then
	response.write(2)
else
	response.write(3)
	if remember="1" then
		response.cookies("th_id")=userid
		response.cookies("th_id").expires=DateAdd("d",1,now())
		response.cookies("th_pwd")=password
		response.cookies("th_pwd").expires=DateAdd("d",1,now())
	end if
	if session.contents.count <>0 then
	session.contents.removeall()
	end if
	session("th_id")=userid
	session("th_name")=rs("th_name")
	session("th_pwd")=rs("th_pwd")
end if
end if
rs.close
conn.close
set rs=nothing
set conn=nothing
%>


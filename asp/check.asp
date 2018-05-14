<%Response.Charset="utf-8"%>
<!-- #include file="conn.asp"-->
<!-- #include file="QL.Des.asp"-->
<%
userid=request.Form("id")
password=request.Form("pass")
remember=request.Form("remember")
identity=request.Form("identity")
code=request.Form("code")

if identity="th" then
	dim sql1
	sql1="SELECT th_name,th_pwd FROM teacher_info WHERE th_id='"&userid&"'"
	call check(userid,"th_pwd","th_name",sql1,password,remember)
else if identity="am" then
	dim sql2
	sql2="SELECT admin_name,admin_pwd FROM admin_info WHERE admin_id='"&userid&"'"
	call check(userid,"admin_pwd","admin_name",sql2,password,remember)
end if
end if

function check(ID,PWD,NAME,SQL,password,remember)
if code=session("CmsCode") then
	' Dim des
	' Set des = new DesClass
	' With des
	' 	.Key = "012138DC"
	' 	.Mode = "ebc"
	' 	.Padding = "zero"
	' 	.Encoding = "utf-8"
	' End With

	set rs=conn.Execute(SQL)
	if rs.eof then			'查不到记录，姓名不存在'
		response.write(1)
	else if des.Decode(rs(PWD))<>password then
		response.write(2)
	else
		response.write(3)
		if remember="1" then
			response.cookies("userid")=ID
			response.cookies("userid").expires=DateAdd("d",1,now())
			response.cookies("password")=rs(PWD)	'加密后'
			response.cookies("password").expires=DateAdd("d",1,now())
		end if
		if session.contents.count <>0 then
		session.contents.removeall()
		end if
		session("userid")=ID
		session(NAME)=rs(NAME)
		session("password")=rs(PWD)
	end if
	end if
	rs.close
	conn.close
	set rs=nothing
	set conn=nothing
else
response.write("请输入正确的验证码")
end if
end function
%>


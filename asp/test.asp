<%Response.Charset="utf-8"%>
<!-- #include file="conn.asp"-->
<!-- #include file="MD5.asp"-->
<!-- #include file="QL.Des.asp"-->
<%
' set rs=conn.Execute("SELECT admin_name,admin_pwd FROM admin_info WHERE admin_id='10002'")
' if rs.eof then			'查不到记录，姓名不存在'
' 	response.write(1)
' else if rs("admin_pwd")="666666"then
' 	response.write(2)
' else
' 	response.write(MD5("sos12138007",16))
' end if
' end if

' rs.close
' conn.close
' set rs=nothing
' set conn=nothing
rem 用法示例 
userid=request.QueryString("id")
password=request.QueryString("pass")
remember=request.QueryString("remember")
identity=request.QueryString("identity")
code=request.QueryString("code")
response(identity)
' if identity="th" then
' 	dim sql1
' 	sql1="sql1"
' 	call check(userid,sql1,password,remember)
' else if identity="am" then
' 	dim sql2
' 	sql2="sql2"
' 	call check(userid,sql2,password,remember)
' end if
' end if

function check(ID,SQL,password,remember)
if code=session("CmsCode") then
	Dim des
	Set des = new DesClass
	With des
		.Key = "012138DC"
		.Mode = "ebc"
		.Padding = "zero"
		.Encoding = "utf-8"
	End With

	response.write(SQL&"||"&des.Decode(password)&"||"&password&"||"&remember)
else
response.write("请输入正确的验证码")
end if
end function






' call cs("999999")

' function cs(PWD)
' dim str1,des
' str1=PWD
' Set des = new DesClass
' With des
' 	.Key = "012138DC"
' 	.Mode = "ebc"
' 	.Padding = "zero"
' 	.Encoding = "utf-8"
' End With
' 	response.write(des.Encode(str1))
' 	response.write(des.Decode(des.Encode(str1)))
' end function

%>


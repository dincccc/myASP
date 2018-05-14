<!-- #include file="conn.asp"-->
<!-- #include file="QL.Des.asp"-->
<%
'identity'
isfrom=request.Form("isfrom")
th_id=request.Form("th-id")

'changePwd'
pwdOld=request.Form("pwdOld")
pwdNew=request.Form("pwdNew")

'changeInfo'
newPhone=request.Form("newPhone")
newMail=request.Form("newMail")


if isfrom="cp" then
	dim sql1,sqlPwd
	sql1="SELECT th_pwd FROM teacher_info WHERE th_id='"&th_id&"'"
	set rs=conn.execute(sql1)
	if des.Decode(rs("th_pwd"))=pwdOld then
		sqlPwd="UPDATE teacher_info SET th_pwd='"&des.Encode(pwdNew)&"' WHERE th_id='"&th_id&"'"
		call changeSomething(sqlPwd,"")
	else
		response.write("旧密码输入错误！")
	end if
else
	dim sqlInfo
	sqlInfo="UPDATE teacher_info SET th_phone='"&newPhone&"',th_mail='"&newMail&"' WHERE th_id='"&th_id&"'"
	call changeSomething(sqlInfo,"信息修改成功！")
end if

function changeSomething(sql,SUCCESS)
 	on error resume next
	conn.execute(sql)
  	if err.number=0 then
    	response.write(SUCCESS)
 	else
   		'response.write err.description
    	response.write("失败"&err.description)
  	end if
end function

%>
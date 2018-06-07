<!-- #include file="conn.asp"-->
<%
'identity'
isfrom=request.QueryString("isfrom")

'LabInfo'
'lab_id=request.QueryString("lab-id")
lab_address=request.QueryString("lab-adr")
lab_type_id=request.QueryString("lab-type")
lab_capacity=request.QueryString("lab-cap")

'TeacherInfo'
th_id=request.QueryString("th-id")
th_name=request.QueryString("th-name")
th_sex=request.QueryString("th-sex")
th_class=request.QueryString("th-class")
th_course=request.QueryString("th-course")
th_phone=request.QueryString("th-phone")
th_mail=request.QueryString("th-mail")

if isfrom="addLab" then
	dim sqlLab,sql1,sql2
	sql1="INSERT INTO lab_info (`lab_id`,`lab_type_id`,`lab_address`,`lab_capacity`) "
	sql2="VALUES (default,'"&lab_type_id&"','"&lab_address&"','"&lab_capacity&"')"
	sqlLab=sql1&sql2
	call addInfo(sqlLab,"添加实验室信息")
else
	dim sqlTh,sql3,sql4,sql5
	sql3="INSERT INTO teacher_info (`th_id`,`th_name`,`th_pwd`,`th_sex`,`th_phone`,`th_mail`) "
	sql4="VALUES ('"&th_id&"','"&th_name&"',default,'"&th_sex&"','"&th_phone&"','"&th_mail&"')"
	sql5="INSERT INTO teacher_class (`th_id`,`th_class`,`th_course`) VALUES ('"&th_id&"','"&th_class&"','"&th_course&"')"
	sqlTh=sql3&sql4
	call addInfo(sqlTh,"添加教师信息")
	call addInfo(sql5,"添加教师课程信息")
end if

function addInfo(sql,TEXT)
 	on error resume next
	conn.execute(sql)
  	if err.number=0 then
    	response.write(TEXT&":成功")
 	else
   		'response.write err.description
    	response.write(TEXT&":失败"&err.description)
  	end if
end function

%>
